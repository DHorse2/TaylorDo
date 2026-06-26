
# Create a docs/OUTREACH.md file with this structure

Project positioning
Target users
Safety promise
Distribution channels
Community posting rules
Release checklist
Country/language expansion plan

That gives TaylorDo a repeatable outreach playbook instead of a one-time marketing burst.

## TaylorDo Global outreach strategy

TaylorDo should be positioned as a **safe, scriptable HDD maintenance toolkit for Windows power users, technicians, refurbishers, and MyDefrag users** — not as a generic “PC speed booster.”

The opportunity is still real: Windows remains the largest desktop OS family globally, with StatCounter showing Windows at **62.16% of desktop OS share in May 2026**, and Windows 10 still at **26.36% of Windows versions** even after Microsoft ended Windows 10 support on **October 14, 2025**. ([StatCounter Global Stats][1]) MyDefrag itself is an older but capable niche tool: MyDefrag 4.3.1 dates from 2010, and the VA technology reference describes it as a Windows defragmenting utility with scripts for system disks, data disks, free-space consolidation, and precise file layout. ([TechSpot][2])

## Strategic position

### **Core identity**

TaylorDo is a maintained wrapper, script library, scheduler, installer, and tooling ecosystem around MyDefrag for HDD-based Windows systems.

### **Do not lead with**

* “Speed up any PC”
* “Optimize SSDs”
* “Cleaner/booster”
* “Modern defrag replacement”

### **Lead with**

* Safe HDD-only maintenance
* Repeatable scheduled optimization
* MyDefrag scripting made easier
* Technician/refurbisher friendly
* Transparent scripts, logs, and configuration
* VSCodium/VS Code language support for `.MyDc` and `.MyD`

## Target audiences

| Audience                            |                             Why they care | Best message                                                                              |
| ----------------------------------- | ----------------------------------------: | ----------------------------------------------------------------------------------------- |
| PC repair shops                     |       They still see HDD laptops/desktops | “Repeatable HDD maintenance scripts with safety checks.”                                  |
| Refurbishers                        | Older Windows machines often include HDDs | “Prepare HDD systems consistently before resale or donation.”                             |
| Power users                         |           They like control and scripting | “A maintained MyDefrag workflow with scheduler and script tooling.”                       |
| Data hoarders / home lab users      |                    They manage many disks | “Scriptable HDD organization and free-space consolidation.”                               |
| Retro / legacy Windows users        |       They maintain older Windows systems | “Keep old HDD-based Windows systems tidy without pretending they are modern SSD systems.” |
| Developers editing MyDefrag scripts |                     They need syntax help | “VSCodium/VS Code language extension for MyDefrag scripts.”                               |

## Distribution channels

### 1. GitHub as the source of truth

GitHub should be the authoritative home for source, issues, releases, and documentation. Releases are designed to package software, release notes, and binary files for users to download. ([GitHub Docs][3])

Recommended GitHub structure:

* `README.md` with “Who this is for / not for”
* `docs/SAFETY.md`
* `docs/INSTALL.md`
* `docs/SCHEDULER.md`
* `docs/SSD-GUARD.md`
* `docs/MYDEFRAG-SCRIPTING.md`
* `CHANGELOG.md`
* GitHub Releases containing:

  * TaylorDo installer
  * MyDefrag language extension `.vsix`
  * Checksums
  * Release notes
  * Known limitations

### 2. Open VSX for VSCodium users

Because you use VSCodium and care about FOSS-friendly distribution, the MyDefrag language extension should be published on **Open VSX** first. Open VSX is an Eclipse Foundation open-source alternative to the Visual Studio Marketplace, and its FAQ explicitly mentions VSCodium as a consumer of the registry. ([Open VSX][4])

Practical angle:

* Publish `macrodm.mydefrag-syntax`
* Include screenshots of diagnostics, hover, include navigation, and preview output
* Link back to TaylorDo and MyDefrag scripting docs

### 3. VS Code Marketplace as optional reach

Even if VSCodium is the primary IDE, publishing to the VS Code Marketplace increases discoverability for users who are not using VSCodium. Microsoft’s VS Code publishing docs describe `vsce` as the CLI for packaging and publishing extensions, and VSIX packaging can also be used for direct distribution. ([Visual Studio Code][5])

Recommendation:

* Publish to Open VSX first.
* Publish to VS Code Marketplace later if you are comfortable with the Microsoft account/PAT workflow.
* Keep the `.vsix` downloadable from GitHub Releases either way.

### 4. SourceForge as a global mirror, not the primary home

SourceForge can help with global downloads because it operates a geographically distributed mirror network for open-source file releases. ([SourceForge][6])

Use SourceForge for:

* Installer downloads
* Release mirrors
* Users who search old-school utility sites

Do not make SourceForge the documentation source. Keep docs and issues on GitHub.

## Outreach communities

Start with communities where HDDs, refurbishing, home labs, scripting, and legacy Windows maintenance are normal topics.

Good-fit communities:

* ServeTheHome forums — has active “Hard Drives and Solid State Drives” and home/small-business server sections. ([ServeTheHome Forums][7])
* r/DataHoarder — relevant to storage-heavy users, but avoid drive-showoff or generic promotional posts because the subreddit has strict moderation expectations. ([Reddit][8])
* Super User / Stack Exchange — only answer specific questions; do not promote.
* VSCodium / VS Code extension communities — focus on the language extension, not defrag.
* Windows technician/refurbisher forums — focus on repeatable maintenance workflows.
* GitHub topics:

  * `mydefrag`
  * `defrag`
  * `windows`
  * `hdd`
  * `vscode-extension`
  * `vscodium`
  * `language-server`

## Geographic strategy

Do not start by trying to market country-by-country. Start by **language and use-case**.

### Phase 1: English-first

Target:

* Canada
* United States
* United Kingdom
* Australia
* India
* Philippines
* South Africa
* Singapore

Reason: English documentation gets the widest initial reach with the least translation cost.

### Phase 2: Lightweight localization

Translate only the landing page and safety page first.

Suggested languages:

* German
* French
* Spanish
* Portuguese
* Polish
* Japanese

Do not translate the whole manual until there is evidence of actual users from those language groups.

## Trust requirements

TaylorDo touches disks, scheduled tasks, and system-level maintenance. Outreach will fail unless the project looks safe.

Minimum trust package:

* Clear statement: **HDD only; SSDs are skipped or warned**
* Screenshot of SSD warning behavior
* SHA256 checksums for releases
* Versioned installer
* Uninstaller documented
* Task Scheduler entries documented
* “What TaylorDo changes on your system” page
* “How to remove TaylorDo completely” page
* Known limitations
* Backup warning before running defrag operations

## Messaging

Use a narrow, credible promise:

> TaylorDo provides a repeatable MyDefrag based HDD maintenance workflow for Windows systems, with scripts, scheduling, installer support, and editor tooling.

Avoid over claiming performance. The safer pitch is:

> TaylorDo is for people who still maintain HDD-based Windows machines and want a transparent, scriptable, scheduled workflow instead of one-off manual defrag runs.

## Rollout sequence

### Phase 0 — Prepare

* Finish README, install docs, safety docs, and screenshots.
* Create GitHub Releases.
* Package the VSCodium extension as `.vsix`.
* Add checksums.
* Add a “not for SSD optimization” warning everywhere.

### Phase 1 — Developer/tooling release

* Publish the MyDefrag language extension to Open VSX.
* Add `.vsix` to GitHub Releases.
* Post in VSCodium / VS Code extension spaces as a language-support tool.

### Phase 2 — HDD/Windows technician release

* Publish TaylorDo installer release.
* Post one practical guide:

  * “How I schedule safe HDD maintenance with MyDefrag scripts”
* Share as a tutorial, not an advertisement.

### Phase 3 — Global long-tail discovery

* Add SourceForge mirror.
* Create GitHub Pages site.
* Add screenshots and short demo GIFs.
* Add search-friendly pages:

  * “MyDefrag Windows 10”
  * “MyDefrag scripts”
  * “HDD scheduled defrag”
  * “VSCodium MyDefrag syntax highlighting”

## Success metrics

Track simple signals:

* GitHub release downloads
* GitHub stars
* GitHub issues opened
* Open VSX installs
* VSIX downloads
* SourceForge downloads by country
* Documentation page views
* Forum replies that ask for support or clarification

The most important early metric is not raw downloads. It is whether technically capable users can install it, understand the safety model, and report useful feedback.

## Recommended immediate next step

Create a `docs/OUTREACH.md` file with this structure:

* Project positioning
* Target users
* Safety promise
* Distribution channels
* Community posting rules
* Release checklist
* Country/language expansion plan

That gives TaylorDo a repeatable outreach playbook instead of a one-time marketing burst.

[1]: https://gs.statcounter.com/os-market-share/desktop/worldwide/?utm_source=chatgpt.com "Desktop Operating System Market Share Worldwide | Statcounter Global Stats"
[2]: https://www.techspot.com/downloads/3720-jkdefrag-mydefrag.html?utm_source=chatgpt.com "MyDefrag Download Free - 4.3.1"
[3]: https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases?utm_source=chatgpt.com "About releases - GitHub Docs"
[4]: https://open-vsx.org/?utm_source=chatgpt.com "Open VSX Registry"
[5]: https://code.visualstudio.com/api/working-with-extensions/publishing-extension?from=20423&from_column=20423&utm_source=chatgpt.com "Publishing Extensions | Visual Studio Code Extension API"
[6]: https://sourceforge.net/p/sourceforge/url/mirrors?utm_source=chatgpt.com "SourceForge Support / Documentation / Mirrors"
[7]: https://forums.servethehome.com/index.php?utm_source=chatgpt.com "ServeTheHome Forums"
[8]: https://www.reddit.com/r/DataHoarder/comments/1ubadm4/removed/?utm_source=chatgpt.com "[Removed]"
