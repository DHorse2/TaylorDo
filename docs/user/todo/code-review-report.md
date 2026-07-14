# Taylor2 Code Review

## Summary

Taylor2 has a workable include-fragment structure, but the current tree is in the middle of a risky file-extension and command-wrapper transition. The highest risk is not the MyDefrag syntax itself; it is integration drift between installer-generated files, BAT launchers, and `.MyD` includes. Several wrappers can ignore configured `SKIP` roles or fail to run the intended daily scripts.

Execution note: `.AI/SESSION_TEMPLATE.md` was required by the session instructions, but it is not present in this checkout. The requested `.AI/Prompts/Taylor2-Code-Review-Prompt.md` was loaded and followed.

## High Priority Findings

| Severity | Area | Finding | Evidence | Recommended Fix |
|---|---|---|---|---|
| High | Installer/runtime integration | Volume-role files were migrated to `.txt` in runtime paths, but the installer still discovers and writes `.MyDc`. Installed systems can end up with files the current scripts no longer read. | `TaylorDoConfig.nsi` still uses `VolumeType*.MyDc` at lines 374 and 714, and writes `VolumeType$Role*.MyDc` at lines 437, 456, 475, 494, 513, 532, 551, 570, 589, and 608. Runtime files now read `.txt`, for example `DefragVolumeDev.MyD` line 7 and `Scripts/ScriptsByDrive/DriveC.bat` line 10. | Pick one extension for volume-role fragments. If `.txt` is intentional, update installer discovery, write targets, suffix stripping, packaged files, BAT wrappers, and MyD includes together. |
| High | Command script | The `SKIP` branch in `TdoSetVolume.bat` writes to the wrong target because of a stray `F` after the redirection path. | `TaylorDoVs0_5/src/TdoSetVolume.bat:69` contains `<nul set /p "=SKIP" > "%OutputFile%"F`. | Change it to write exactly to `"%OutputFile%"`. |
| High | Command script | Per-drive wrappers read `VolumeName` but compare an empty string to `SKIP`, so skipped drives keep executing. | `Scripts/ScriptsByDrive/DriveC.bat:10` reads `VolumeName`; line 11 tests `if /I ""=="SKIP" (`. The same pattern appears in DriveD, DriveE, DriveF, and DriveG. | Compare `!VolumeName!` to `SKIP` in each wrapper and in the reset-script copies. |
| High | Command script | `AllDaily.bat` has malformed or incomplete IF control flow and does not call the Dev daily script. | Lines 9, 16, 23, and 30 contain `if not "!VolumeName!"=="SKIP"` without a same-line command or block. The Dev section changes directory instead of calling `DevDaily.bat`. | Match the parenthesized block style used in AllWeekly/AllMonthly/AllYearly, and call `DevDaily.bat` when Dev is not skipped. |

## Medium Priority Findings

| Severity | Area | Finding | Evidence | Recommended Fix |
|---|---|---|---|---|
| Medium | Parser/tooling | `mydefrag-preprocess.ps1 -IncIncludeLine` can repeatedly process the same include line. | The loop starts at `mydefrag-preprocess.ps1:155`; when `IncIncludeLine` is set, lines 172-174 decrement `$i`, so the `for` loop increments it back to the same include line. | Keep `$i` monotonic and track display source-line numbers separately. |
| Medium | Installer | Start-menu shortcuts point at singular folder names that do not match the repo layout. | `TaylorDoSetupFull.nsi:1081-1084` target `ScriptDaily`, `ScriptWeekly`, `ScriptMonthly`, and `ScriptYearly`; the repo has `ScriptsDaily`, `ScriptsWeekly`, `ScriptsMonthly`, and `ScriptsYearly`. | Update shortcut targets or install matching folders. |
| Medium | Diagnostics/editor integration | `package.json` registers `.mydfrg` and `.mdf`, but Taylor2 files use `.MyD`, `.MyDc`, `.MyDs`, and `.MyDx`. | `package.json:5-8`; repository files under `TaylorDoVs0_5/src` use the MyDefrag extensions extensively. | Register the actual project extensions or mark this manifest as non-authoritative. |

## Low Priority Findings

| Severity | Area | Finding | Evidence | Recommended Fix |
|---|---|---|---|---|
| Low | Maintainability | `CheckSSD.bat` leaves normalization debug output enabled on every run. | `CheckSSD.bat:45-55` echoes each normalization step. | Gate behind a debug flag or remove after validation. |
| Low | Process | The required session template file is absent. | `.AI` contains only `Prompts`, and `.AI/SESSION_TEMPLATE.md` could not be read. | Add the template or update the instruction entry point. |

## Architecture Notes

The architecture depends on many small include fragments and generated role-selection files. That can work, but it needs a single source of truth for naming, extension choice, install layout, and generated file format. Right now those decisions are spread across NSIS, BAT launchers, MyDefrag scripts, and documentation, so a small migration like `.MyDc` to `.txt` creates several independent failure modes.

The command layer also needs a consistent wrapper contract. A drive wrapper should load role data, skip if requested, verify media safety, save state, select volume/action, run MyDefrag, and propagate failures. Several wrappers implement most of that, but the repeated copy-paste means defects repeat across many files.

## Relationship To MyDefrag Language Extension

Taylor2 should align with the MyDefrag language extension on syntax classification and include resolution, especially for `.MyD`, `.MyDc`, `.MyDs`, and `.MyDx` files. The extension already treats `Name("C:")` style volume conditions as syntax-sensitive MyDefrag fragments; Taylor2 should avoid using extension changes as a workaround for installer or wrapper file mismatches.

Taylor2 can intentionally differ in build and installer workflow, but diagnostics should still model the same include graph and grammar. The most useful alignment would be a deterministic include resolver that can report missing includes, cyclic includes, and extension/manifest mismatches before runtime.

## Suggested Revisions

- Update `TaylorDoVs0_5/src/Commands/Install/TaylorDoConfig.nsi` to use the chosen volume-role extension consistently.
- Fix `TaylorDoVs0_5/src/TdoSetVolume.bat` line 69.
- Fix all `TaylorDoVs0_5/src/Scripts/ScriptsByDrive/Drive*.bat` and reset copies to compare `!VolumeName!` to `SKIP`.
- Repair `TaylorDoVs0_5/src/Scripts/ScriptsDaily/AllDaily.bat` control flow.
- Rewrite `TaylorDoVs0_5/src/mydefrag-preprocess.ps1` source-line numbering for `-IncIncludeLine`.
- Correct `TaylorDoVs0_5/src/Commands/Install/TaylorDoSetupFull.nsi` shortcut targets.
- Align `package.json` language extensions with Taylor2 file extensions.

## Created Or Updated Files

- `code-review-report.md`
- `code-review-diagnostics.jsonl`
- `code-review-todo.md`

## Revision Log

- Created `code-review-report.md` with structured findings, architecture notes, MyDefrag extension relationship notes, and suggested revisions.
- Created `code-review-diagnostics.jsonl` with deterministic one-object-per-line diagnostics for external ingestion.
- Created `code-review-todo.md` with prioritized actionable tasks and clickable repository links.

## Standard Diagnostics

Generated files:

- `code-review-diagnostics.jsonl`
- `code-review-todo.md`

Summary counts:

| Severity | Count |
|---|---:|
| High | 4 |
| Medium | 3 |
| Low | 2 |
