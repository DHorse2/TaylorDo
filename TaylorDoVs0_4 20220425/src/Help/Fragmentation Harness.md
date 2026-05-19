
# **Repeatable Fragmentation Workload Generator + Verifier System**.

Think of it as: **Fragmentation Harness = Controlled workload generator + measurement + reset cycle**

Below is a practical design you can implement with built-in Windows tools + your existing scripting skills.

---

# 🧠 1. What you’re actually building

A proper fragmentation harness has 4 components:

1. **Disk reset stage**
2. **Fragmentation generator (workload engine)**
3. **Measurement stage**
4. **Repeatable test cycles**

---

# 🧰 2. Core Windows tools you can use

You don’t need third-party hardware tools. These are enough:

### File + disk manipulation

* `fsutil`
* `robocopy`
* `copy`
* PowerShell `New-Item`, `Set-Content`
* `cipher` (optional wipe patterns)

### Measurement / inspection

* `fsutil file queryextents`
* `defrag /A` (analyze only)
* PowerShell WMI disk queries
* Sysinternals tools (optional but powerful):

  * `contig.exe`
  * `diskspd.exe` (VERY useful)

---

# ⚙️ 3. Fragmentation generation strategies

You want **controlled fragmentation**, not random chaos.

## 🔥 Strategy A — Small random file write storm (best baseline)

This is the closest to real-world fragmentation.

### What it does:

* creates thousands of small files
* writes variable-sized chunks
* deletes/recreates randomly

### Example batch skeleton:

```bat
@echo off
setlocal enabledelayedexpansion

set "TARGET=D:\FragTest"
set "ITER=20000"

if not exist "%TARGET%" mkdir "%TARGET%"

for /L %%i in (1,1,%ITER%) do (
    set /a SIZE=(%RANDOM% %% 4096) + 512
    set "FILE=%TARGET%\file_%%i.bin"

    fsutil file createnew "!FILE!" !SIZE! >nul
)

echo Done
```

👉 This creates *heavy metadata fragmentation pressure*

---

## 🔥 Strategy B — File splitting / reassembly (VERY effective)

This creates *true HDD-style fragmentation*.

### Concept:

* create a file in chunks
* append small random blocks repeatedly

### PowerShell version:

```powershell
$path = "D:\FragTest\bigfile.dat"
Remove-Item $path -ErrorAction SilentlyContinue

1..5000 | ForEach-Object {
    $bytes = New-Object byte[] (Get-Random -Minimum 4KB -Maximum 1MB)
    (New-Object Random).NextBytes($bytes)

    [System.IO.File]::AppendAllBytes($path, $bytes)
}
```

👉 Forces scattered allocation on disk

---

## 🔥 Strategy C — Fill → delete → refill cycle (fragmentation amplifier)

This is how you get *worst-case fragmentation*.

### Logic:

1. Fill disk to ~85–95%
2. Delete random subset of files
3. Refill with new files

Batch sketch:

```bat
for /L %%i in (1,1,5000) do (
    fsutil file createnew D:\FragTest\file%%i.dat 1048576 >nul
)

:: simulate fragmentation gap creation
for /L %%i in (1,1,1000) do (
    del /f /q D:\FragTest\file%%i.dat
)
```

Then rerun fill stage again.

---

## 🔥 Strategy D — Random overwrite fragmentation (advanced)

Instead of deleting, you overwrite:

* same file
* random offsets
* variable block sizes

Best done in PowerShell or C#.

---

# 📊 4. Measurement stage (critical)

You need to *prove fragmentation happened*.

## Option A — Windows built-in

```cmd
defrag D: /A /V
```

Shows:

* file fragmentation %
* free space fragmentation

---

## Option B — File-level extent inspection

```cmd
fsutil file queryextents D:\FragTest\bigfile.dat
```

This shows real physical cluster distribution.

---

## Option C — Diskspd (recommended for serious testing)

You can measure:

* seek performance
* random I/O degradation

Example:

```cmd
diskspd.exe -b4K -r -o32 -t4 -d60 D:\FragTest\testfile.dat
```

---

# 🔁 5. Turn it into a “Harness” (automation loop)

Now wrap everything into a cycle:

## Lifecycle:

1. Clean disk
2. Generate fragmentation workload
3. Measure fragmentation
4. Run I/O benchmark
5. Log results
6. Repeat

---

## Example master controller (batch):

```bat
@echo off
set TARGET=D:\FragTest

echo === RESET ===
rmdir /s /q %TARGET%
mkdir %TARGET%

echo === GENERATE FRAGMENTATION ===
call generate_frag.bat

echo === ANALYZE ===
defrag D: /A /V > report.txt

echo === I/O TEST ===
diskspd.exe -b4K -r -o32 -t4 -d30 D:\FragTest\testfile.dat >> report.txt

echo DONE
```

---

# 🧪 6. What makes this a real “harness”

To make it *engineering-grade*, add:

### ✔ Random seeds per run

### ✔ Logging (CSV output)

### ✔ Disk fill control (percentage-based)

### ✔ Repeatable profiles:

* light fragmentation
* medium fragmentation
* worst-case fragmentation
* metadata-heavy fragmentation

---

# ⚠️ Important safety note

Do NOT run this on:

* SSDs (wastes lifespan, no real fragmentation effect)
* system drive
* RAID arrays without understanding controller behavior

Best test target:

* spare HDDs
* USB HDD enclosures
* NAS disks (carefully)

---

# 🧭 If you want to go further

I can help you upgrade this into a full system like:

### 🚀 “Fragmentation Test Framework v1”

* JSON-defined test profiles
* PowerShell orchestrator
* automatic disk scoring
* before/after performance graphs
* integration with your defrag product testing pipeline

Or even:

### 🔬 HDD stress “lab simulator”

* multi-drive parallel fragmentation
* thermal + I/O correlation
* regression testing suite for optimizer validation

Just tell me how far you want to take it.
