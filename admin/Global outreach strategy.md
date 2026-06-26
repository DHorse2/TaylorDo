# TaylorDo Global Outreach Strategy

## Purpose

This document defines the outreach strategy for TaylorDo.

TaylorDo should be presented as a careful, scriptable HDD maintenance toolkit for Windows systems. It should not be marketed as a modern PC booster, registry cleaner, SSD optimizer, or one-click miracle utility.

The outreach goal is to build trust with technically capable users who still maintain HDD-based Windows systems and want a transparent, repeatable workflow.

## Core positioning

TaylorDo is an HDD maintenance and scripting system built around MyDefrag.

It provides:

- A maintained MyDefrag script library
- A repeatable Windows scheduling workflow
- A Windows installer and uninstaller
- HDD-focused volume role configuration
- SSD safeguards and warnings
- Documentation for safe use
- VSCodium and VS Code language tooling for MyDefrag script files

TaylorDo is for users who value control, repeatability, and transparency more than marketing claims.

## What TaylorDo is not

TaylorDo should not be described as:

- A PC booster
- A registry cleaner
- A general Windows optimizer
- An SSD optimizer
- A one-click speed-up product
- A replacement for backups
- A tool that makes old computers perform like new systems

Many booster-style products either do not deliver as promised or imply unrealistic performance gains. TaylorDo should avoid that category completely.

## Performance claims policy

TaylorDo must use conservative performance language.

Preferred claim:

> TaylorDo does not promise dramatic speedups. It provides a careful, repeatable, transparent HDD maintenance workflow for systems where file placement, free-space consolidation, and scheduled defragmentation still matter.

Plain claim:

> TaylorDo is not a PC booster. It is an HDD maintenance and scripting system.

Documentation wording:

> TaylorDo is designed for HDD-based Windows systems. It does not claim to make old computers “like new,” and it does not optimize SSDs. Any performance improvement from defragmentation is workload-dependent and usually measured in small percentage differences, not dramatic transformations. TaylorDo’s value is in safe, repeatable, scheduled HDD maintenance using transparent MyDefrag scripts.

Avoid these claims:

- Dramatically speeds up your PC
- Makes your computer like new
- Fixes slow Windows systems
- Optimizes all drives
- Boosts gaming performance
- Cleans and repairs your PC
- Safe for every computer

Use these claims instead:

- Provides repeatable HDD maintenance
- Uses transparent MyDefrag scripts
- Helps manage scheduled HDD defragmentation
- Separates HDD workflows from SSD safeguards
- Gives technicians and power users a controlled maintenance process
- Supports legacy and mixed Windows environments where HDDs are still present

## Safety promise

The safety promise should be visible in the README, installer text, release notes, and documentation.

TaylorDo should clearly state:

- HDDs are the intended target.
- SSDs should not be defragmented as if they were HDDs.
- The system warns or skips where SSD risk is detected.
- Users should back up important data before maintenance work.
- Scheduled tasks are documented and removable.
- The installer and uninstaller behavior is documented.
- Scripts are text files that users can inspect.

Suggested wording:

> TaylorDo is designed to be transparent. It uses readable scripts, documented scheduled tasks, and visible configuration files. Users should be able to understand what TaylorDo changes before they run it.

## Target audiences

## Primary audiences

### PC repair technicians

Why they may care:

- They still encounter HDD-based systems.
- They need repeatable maintenance procedures.
- Furthermore, they need tools that are explainable to customers.

Message:

> Repeatable HDD maintenance scripts with clear scheduling and safety documentation.

### Refurbishers

Why they may care:

- Older donated or resold systems often still use HDDs.
- They need consistent preparation workflows.
- They may need to process several systems in the same way.

Message:

> Prepare HDD-based Windows systems consistently before resale, donation, or reuse.

### Power users

Why they may care:

- They prefer visible scripts over opaque utilities.
- They may already know MyDefrag or similar tools.
- Not only that, but they want control over what happens to their drives.

Message:

> A transparent, scriptable HDD maintenance workflow based on MyDefrag.

### Data hoarders and home lab users

Why they may care:

- They manage many disks.
- They understand that HDD organization can still matter.
- Not only that, but they value logs, repeatability, and predictable behavior.

Message:

> Controlled HDD organization and free-space consolidation for systems that still use spinning disks.

### Legacy Windows users

Why they may care:

- They maintain older systems for practical or historical reasons.
- They may use older tools but want safer packaging and documentation.

Message:

> A maintained workflow for older HDD-based Windows systems, without pretending they are modern SSD systems.

### MyDefrag script users

Why they may care:

- They need better editing, validation, and navigation support.
- They want syntax highlighting and diagnostics.

Message:

> VSCodium and VS Code tooling for MyDefrag script development.

## Secondary audiences

- Open-source Windows utility users
- Small business IT maintainers
- Retro-computing users
- Documentation-focused technical users
- Users migrating old MyDefrag workflows into a maintained structure

## Distribution channels

## GitHub

GitHub should be the primary source of truth.

Use GitHub for:

- Source code
- Issues
- Discussions
- Release packages
- Checksums
- Documentation
- Changelog
- Roadmap

Recommended repository files:

- `README.md`
- `CHANGELOG.md`
- `LICENSE.md`
- `docs/INSTALL.md`
- `docs/SAFETY.md`
- `docs/SCHEDULER.md`
- `docs/SSD-GUARD.md`
- `docs/MYDEFRAG-SCRIPTING.md`
- `docs/OUTREACH.md`
- `docs/UNINSTALL.md`

Recommended release assets:

- TaylorDo installer
- TaylorDo source archive
- MyDefrag language extension `.vsix`
- SHA256 checksums
- Release notes
- Known limitations

## Open VSX

Open VSX should be the preferred registry for the VSCodium extension.

Use Open VSX for:

- MyDefrag syntax highlighting
- MyDefrag diagnostics
- Include navigation
- Preview tooling
- Language server distribution

The extension description should link back to the TaylorDo repository and documentation.

## Visual Studio Marketplace

The Visual Studio Marketplace can be used later for additional reach.

Use it only after:

- The Open VSX package is working
- The extension packaging process is repeatable
- Release notes are stable
- The extension README is clear

The `.vsix` should remain available from GitHub Releases regardless of marketplace availability.

## SourceForge

SourceForge may be useful as a global download mirror for users who search for traditional Windows utilities.

Use SourceForge for:

- Release mirrors
- Installer downloads
- Visibility among older utility users

Do not use SourceForge as the primary documentation or issue-tracking location.

## Project website or GitHub Pages

A small project website can improve trust and search discovery.

Recommended pages:

- Home
- Download
- Safety
- Installation
- Screenshots
- MyDefrag scripting
- VSCodium extension
- FAQ
- Uninstall

## Community outreach

## General rule

Do not post TaylorDo as an advertisement.

Post it as:

- A technical write-up
- A project announcement
- A maintenance workflow
- A MyDefrag scripting tool
- A VSCodium language extension
- A refurbishing or HDD maintenance case study

The best outreach is useful even to readers who do not install TaylorDo.

## Good-fit communities

Potential communities:

- HDD and storage forums
- Data hoarding communities
- Home lab communities
- Windows technician forums
- Refurbisher communities
- VSCodium and VS Code extension communities
- Retro-computing communities
- Open-source Windows utility communities

## Community posting rules

Before posting:

- Read the community rules.
- Confirm that project announcements are allowed.
- Do not post the same text everywhere.
- Avoid marketing tone.
- Explain the safety model.
- State clearly that TaylorDo is HDD-focused.
- Mention that it is not an SSD optimizer.
- Include screenshots only where allowed.
- Include one primary link, preferably the GitHub repository or release page.

Do not:

- Claim large performance gains.
- Attack other tools.
- Pretend TaylorDo is for every user.
- Post in unrelated communities.
- Repost repeatedly.
- Use hype language.

## Suggested community post structure

Use this structure for community posts:

- One-sentence description
- Why the project exists
- Who it is for
- Who it is not for
- Safety model
- Current status
- Link to documentation or release
- Specific feedback requested

Example:

> I maintain TaylorDo, a MyDefrag-based HDD maintenance workflow for Windows systems. It is not a PC booster and does not optimize SSDs. The goal is transparent, repeatable HDD maintenance using readable scripts, documented scheduled tasks, and editor tooling for MyDefrag script files. I would appreciate feedback from users who still maintain HDD-based systems, especially around safety documentation, installer behavior, and scheduling defaults.

## Global strategy

## Phase 1: English-first release

Start with English documentation and English-speaking technical communities.

Initial regions:

- Canada
- United States
- United Kingdom
- Australia
- New Zealand
- India
- Philippines
- South Africa
- Singapore

This phase should focus on clarity, safety, and feedback.

## Phase 2: Lightweight localization

Translate only the most important pages first.

Priority pages:

- README summary
- Safety page
- Install page
- Download page
- Uninstall page

Suggested first languages:

- German
- French
- Spanish
- Portuguese
- Polish
- Japanese

Do not translate the full documentation until there is evidence of users from those language groups.

## Phase 3: Regional documentation

If usage grows in specific countries or languages, create regional notes.

Possible regional notes:

- Windows version expectations
- Language-specific installer screenshots
- Localized warnings about SSD use
- Localized uninstall instructions
- Links to translated community posts

## Release checklist

Before public outreach, confirm the following:

- README explains what TaylorDo is.
- README explains what TaylorDo is not.
- Safety documentation exists.
- SSD warning behavior is documented.
- Installer behavior is documented.
- Uninstaller behavior is documented.
- Scheduled tasks are documented.
- Default volume role behavior is documented.
- Screenshots are available.
- Release notes are written.
- SHA256 checksums are published.
- Known limitations are listed.
- Backup warning is visible.
- GitHub Issues are enabled or an alternative support channel is documented.
- The VSCodium extension can be installed from `.vsix`.
- The Open VSX publishing process has been tested.

## Documentation checklist

Create or verify these documents:

- `README.md`
- `docs/INSTALL.md`
- `docs/SAFETY.md`
- `docs/SCHEDULER.md`
- `docs/SSD-GUARD.md`
- `docs/UNINSTALL.md`
- `docs/MYDEFRAG-SCRIPTING.md`
- `docs/FAQ.md`
- `docs/OUTREACH.md`

## Screenshot checklist

Recommended screenshots:

- Installer welcome page
- Scheduler options page
- Volume role configuration
- SSD warning or skip behavior
- Example MyDefrag script
- VSCodium syntax highlighting
- VSCodium diagnostics
- Include preview output
- GitHub Release page

## Support policy

TaylorDo should have a simple support policy.

Suggested wording:

> TaylorDo is provided for technically capable users who understand that disk maintenance has risk. Please read the safety documentation before running scheduled maintenance. Report reproducible issues with Windows version, TaylorDo version, drive type, script used, and relevant logs.

Issue reports should request:

- TaylorDo version
- Windows version
- HDD or SSD status
- Drive role configuration
- Script name
- Installer or portable use
- Scheduled task name, if relevant
- Log output
- Steps to reproduce

## Trust-building content

High-value content to publish:

- How TaylorDo detects or avoids SSD workflows
- What scheduled tasks TaylorDo creates
- How to inspect the scripts before running them
- How to uninstall TaylorDo
- How to disable scheduled tasks
- How TaylorDo differs from PC booster products
- Why performance claims are conservative
- How to use the VSCodium extension to inspect MyDefrag scripts

## Search-friendly topics

Potential documentation or article titles:

- TaylorDo HDD maintenance for Windows
- MyDefrag scripts for scheduled HDD maintenance
- Safe MyDefrag workflow for Windows HDDs
- VSCodium extension for MyDefrag scripts
- Why TaylorDo is not a PC booster
- HDD defragmentation versus SSD optimization
- How to schedule MyDefrag safely
- How to inspect TaylorDo scheduled tasks

## Success metrics

Track practical signals instead of vanity metrics.

Useful metrics:

- GitHub release downloads
- GitHub stars
- GitHub issues opened
- GitHub issue quality
- Open VSX installs
- `.vsix` downloads
- SourceForge downloads
- Documentation page views
- Forum replies from target users
- Bug reports with logs
- Pull requests or documentation corrections

Early success means can:

- understand what TaylorDo is.
- understand what TaylorDo is not.
- install and uninstall it.
- understand the HDD-only safety model.
- report issues clearly.
- The project receives feedback from real HDD maintenance use cases.

## Tone guide

Use this tone:

- Careful
- Technical
- Honest
- Conservative
- Transparent
- Practical

Avoid this tone:

- Hype-driven
- Sales-heavy
- Fear-based
- Miracle-fix language
- Anti-competitor language
- Performance exaggeration

## Short project descriptions

## One-line description

TaylorDo is a transparent, scriptable HDD maintenance workflow for Windows systems, built around MyDefrag.

## Short description

TaylorDo provides a repeatable MyDefrag-based HDD maintenance workflow for Windows systems, including scripts, scheduling, installer support, SSD safeguards, and VSCodium or VS Code tooling for MyDefrag script files.

## Longer description

TaylorDo is designed for users who still maintain HDD-based Windows systems and want a transparent, repeatable process instead of opaque PC booster utilities. It uses readable MyDefrag scripts, documented scheduled tasks, and supporting editor tooling. TaylorDo does not promise dramatic speedups, does not optimize SSDs, and should be used with normal backup precautions.

## Final outreach principle

TaylorDo should earn trust by being clear about its limits.

The project is strongest when it says:

> This is for HDD maintenance, not magic performance boosting.

That honesty is part of the product.
