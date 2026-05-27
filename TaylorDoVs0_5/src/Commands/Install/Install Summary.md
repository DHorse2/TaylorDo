**Taylor Disk Optimizer (TaylorDo)**.

---

# 1. Overall Purpose

This is a **Full installer** (`TaylorDoSetup.exe`) for:

* **Taylor Disk Optimizer (TaylorDo)** – a script/library layer
* Built on top of **MyDefrag v4.3.1**
* Designed for both home users and network/system administrators
* Installs:

  * MyDefrag (if needed)
  * TaylorDo libraries/scripts
  * Start Menu shortcuts
  * Registry entries
  * Environment variables
  * Optional task scheduling (placeholder)
  * Uninstall support

It requires **Administrator privileges** and supports x64 detection.

---

# 2. Installer Configuration

### Product Metadata

* **Name:** Taylor Disk Optimizer
* **Version:** 4.0.1.0
* **Publisher:** David G Horsman (dba MacroDM)
* Unicode installer
* LZMA compression
* Multi-page MUI2 interface (Welcome, License, Components, Directory, Start Menu, Install, Finish)
* Full / Custom install types

### Default Install Locations

Depending on architecture:

* `$PROGRAMFILES32` on x64
* `$PROGRAMFILES` on x86

Base structure:

```
Program Files\
    MyDefrag v4.3.1\
    TaylorDo\
```

---

# 3. Major Installer Sections

## A. -SETTINGS (Initialization Section)

Sets:

* Install directories
* Product variables
* MyDefrag registry paths
* Architecture-aware output folder
* Shell context = all users

This prepares all variables used later.

---

## B. Directory Section

Copies install directory values into:

* `$ProductAppInstallDir` → MyDefrag
* `$INSTDIR` → TaylorDo

---

## C. MyDefrag Section

### Purpose:

Ensures **MyDefrag v4.3.1** is installed.

### Logic:

1. Checks if `MyDefrag.exe` exists.
2. If present:

   * Prompts user to replace it.
3. If missing or replacing:

   * Executes:

     ```
     MyDefrag-v4.3.1.exe
       /silent
       /dir="..."
       /LOG
       /SAVEINF
     ```
4. Writes registry keys:

   * Install path
   * Windows uninstall entry
   * Display name
   * Uninstall string

So this installer acts as a wrapper around the official MyDefrag installer.

---

## D. "Matt Taylor Libraries" Section (Core TaylorDo Install)

This is the **main TaylorDo payload section**.

### Behavior:

1. Checks if TaylorDo already exists.
2. Prompts for:

   * Continue
   * Repair
   * Replace
3. Deletes prior setup/zip artifacts.
4. Recursively copies entire project tree:

   ```
   File /r ..\*.*
   ```

### Script Replacement Logic

It modifies MyDefrag by:

* Backing up existing `*.MyD` scripts to:

  ```
  Example Scripts\
  ```
* Deleting originals
* Replacing with TaylorDo versions

This effectively turns MyDefrag into a TaylorDo-driven environment.

---

# 4. Environment Variables

Uses `EnVar` plugin to add variables in both:

* HKLM
* HKCU

Adds:

* `MyDefragDir`
* `TaylorDoDir`
* `TaylorDoPublisher`
* `TaylorDoProduct`

This allows other scripts/tools to detect install paths globally.

---

# 5. Registry Entries

Creates:

```
HKLM\Software\Taylor Disk Optimizer
    Install_Dir
    ProductName
    Publisher
    Version
```

Also writes uninstall entries to:

```
HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\
```

For both:

* MyDefrag
* TaylorDo

---

# 6. Start Menu Section

Optional shortcut creation.

Creates folder:

```
Start Menu\
    Taylor Disk Optimizer\
```

Shortcuts open Windows Explorer pointed at:

* ScriptCommands
* ScriptsByDrive
* Automatic
* Daily
* Weekly
* Monthly
* Yearly

Also adds:

* Uninstall shortcut

Notably: these are folder shortcuts (Explorer with `-root`) — not executable launchers.

---

# 7. Task Scheduler Section (Incomplete)

Intended to:

* Disable Windows built-in defrag
* Schedule weekly/monthly/yearly TaylorDo runs

Currently placeholder only (ToDo).

---

# 8. Uninstaller

Uninstall Section:

* Removes TaylorDo directory
* Deletes uninstall exe
* Removes registry key
* Executes MyDefrag’s own uninstaller (`unins000.exe`) if present

Important:

* MyDefrag handles its own uninstall
* TaylorDo removes its overlay + registry

---

# 9. UI & Branding

* Custom icon
* Header image
* Welcome page branding
* Dedicated to Matt Taylor
* Embedded version info metadata

---

# 10. Architectural Design Pattern

This installer follows a layered model:

```
MyDefrag (base engine)
    ↑
TaylorDo (script library layer)
    ↑
Start Menu + Environment + Registry integration
```

It does not modify the MyDefrag executable —
it replaces and manages its script ecosystem.

---

# 11. Notable Observations / Potential Issues

* Some small syntax inconsistencies (e.g., missing quotes in AddValue lines).
* Writes uninstall keys using `$StartMenuFolder` — could cause collisions.
* Task Scheduler section not implemented.
* Full recursive `File /r ..\*.*` may include unintended build artifacts.
* Mixed HKCU / HKLM handling may need clearer design intent.
* MyDefragDir variable appears inconsistently used (`$MyDefragDir` vs `$ProductAppInstallDir`).

---

# 12. High-Level Summary

This script:

* Installs MyDefrag if missing
* Installs TaylorDo as a structured script overlay
* Replaces MyDefrag default scripts
* Adds environment variables
* Adds registry entries
* Creates structured Start Menu access
* Provides uninstall support
* Lays groundwork for scheduler automation

It is effectively a **managed distribution and configuration layer** for MyDefrag, transforming it into a branded, structured, script-driven disk optimization framework.

---

If you’d like, I can also:

* Diagram the install flow
* Identify refactoring opportunities
* Modernize it for current NSIS best practices
* Or help you modularize it into reusable install components
