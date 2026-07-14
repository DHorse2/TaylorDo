# Taylor2 Code Review Todo

Summary counts:

| Severity | Count |
|---|---:|
| High | 4 |
| Medium | 3 |
| Low | 2 |

## High Priority

- [ ] Normalize the volume-role extension migration. Update installer discovery and writes in [TaylorDoConfig.nsi](TaylorDoVs0_5/src/Commands/Install/TaylorDoConfig.nsi#L374), suffix handling around line 683, and runtime reads in the BAT/MyD files so `.MyDc` and `.txt` are not mixed.
- [ ] Fix the stray redirect suffix in [TdoSetVolume.bat](TaylorDoVs0_5/src/TdoSetVolume.bat#L69): `> "%OutputFile%"F` should write to the intended `VolumeType*.txt` file.
- [ ] Fix SKIP handling in [DriveC.bat](TaylorDoVs0_5/src/Scripts/ScriptsByDrive/DriveC.bat#L11) and the equivalent DriveD/DriveE/DriveF/DriveG wrappers by comparing `!VolumeName!` instead of `""`.
- [ ] Repair [AllDaily.bat](TaylorDoVs0_5/src/Scripts/ScriptsDaily/AllDaily.bat#L9) so each `if not "!VolumeName!"=="SKIP"` has a parenthesized command block and the Dev section calls `DevDaily.bat`.

## Medium Priority

- [ ] Rewrite the `-IncIncludeLine` behavior in [mydefrag-preprocess.ps1](TaylorDoVs0_5/src/mydefrag-preprocess.ps1#L172) so it does not decrement `$i` and reprocess the same include line.
- [ ] Correct start-menu shortcut targets in [TaylorDoSetupFull.nsi](TaylorDoVs0_5/src/Commands/Install/TaylorDoSetupFull.nsi#L1081) from `ScriptDaily` style names to the actual `ScriptsDaily` directory names.
- [ ] Align [package.json](package.json#L5) language extensions with the real Taylor2 files: `.MyD`, `.MyDc`, `.MyDs`, and `.MyDx`, unless this manifest is intentionally only a placeholder.

## Low Priority

- [ ] Remove or gate debug normalization echoes in [CheckSSD.bat](TaylorDoVs0_5/src/CheckSSD.bat#L45).
- [ ] Add the missing `.AI/SESSION_TEMPLATE.md` or update the local instructions to point at the current `.AI/Prompts/Taylor2-Code-Review-Prompt.md` workflow.
