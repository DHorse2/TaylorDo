````md
# Disk Fragmentation Tools and Testing Methods for Windows 8–11

## Question

I own a disk defragment product for Windows 8–11. 
I am looking for disk tools that could create fragmentation on the disk for testing. 
Do any exist?

---

# Overview

Yes. There are several ways to intentionally create filesystem fragmentation on Windows for testing a defragmentation product. Some utilities help generate fragmentation indirectly, while others help analyze and validate fragmentation patterns.

For modern Windows systems (Windows 8–11), the most effective solution is usually a custom fragmentation test harness combined with NTFS analysis tools.

---

# Existing Fragmentation-Related Tools

## Sysinternals Contig

Website:  
https://learn.microsoft.com/en-us/sysinternals/downloads/contig

Developer: Microsoft

Contig is primarily a file defragmentation utility rather than a fragmentation generator. However, repeated allocation, deletion, and reallocation operations using Contig and related scripts can help produce fragmented file layouts.

Typical usage patterns include:
- Filling a disk nearly full
- Creating and deleting many differently-sized files
- Reallocating large files repeatedly

These operations can generate realistic NTFS fragmentation patterns.

---

## Sysinternals DiskView

Website:  
https://learn.microsoft.com/en-us/sysinternals/downloads/diskview

DiskView visually displays:
- Cluster layout
- File extents
- MFT placement
- Fragmented regions

This is very useful for validating fragmentation test scenarios and visually confirming disk layout changes.

---

## FSUTIL

Documentation:  
https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/fsutil-file

Windows includes the native `fsutil` utility, which can create large files for fragmentation testing.

Example:

```cmd
fsutil file createnew bigfile.bin 1073741824
````

A common fragmentation strategy:

1. Fill the disk with temporary files
2. Delete selected files to create free-space holes
3. Create new large files that must allocate fragmented extents

This approach creates realistic fragmentation behavior similar to real-world systems.

---

# Older Dedicated Fragmentation Generators

Older utilities such as:

* FragTest
* FragGen

were specifically designed to generate fragmented disks for benchmarking.

However, most are now:

* Obsolete
* 32-bit only
* Unsupported
* Not designed for Windows 10 or Windows 11

These tools are generally not recommended for modern commercial testing.

---

# Recommended Modern Approach

## Build a Custom Fragmentation Harness

For a commercial disk optimizer or defragmentation product, a custom test harness is usually the best solution.

A controlled fragmentation generator allows:

* Repeatable tests
* Automated regression testing
* Realistic fragmentation scenarios
* Modern NTFS behavior testing

---

# Suggested Fragmentation Test Process

## Phase 1 — Prepare the Volume

Typical setup:

* Quick format NTFS
* Disable background optimization where appropriate
* Configure controlled free-space levels

---

## Phase 2 — Seed Fragmentation

Create thousands of files with:

* Random sizes
* Random creation order
* Different write patterns
* Different lifetimes

---

## Phase 3 — Create Free-Space Holes

Delete:

* Every Nth file
* Random file groups
* Specific file-size categories

This produces fragmented free space.

---

## Phase 4 — Force Fragmented Allocations

Allocate:

* Very large files
* Append-growing files
* VM images (VHD/VHDX)
* ZIP archives
* Database-style files

These patterns force multi-extent allocations.

---

## Phase 5 — Validate Fragmentation

Useful validation methods:

* `defrag.exe /A`
* Sysinternals DiskView
* NTFS retrieval pointers
* Custom extent analysis tools

---

# Important Windows 8–11 Considerations

Modern Windows versions aggressively reduce fragmentation using:

* Improved NTFS allocation algorithms
* Background optimization
* Write caching
* SSD-aware allocation strategies
* TRIM support

As a result, severe fragmentation is harder to create than on older systems such as Windows XP.

To generate significant fragmentation on modern systems:

* Use low free-space conditions
* Interleave allocations and deletions
* Use growing large-file workloads

---

# SSD Considerations

Traditional defragmentation should generally not be performed on SSDs.

SSD-focused testing should instead validate:

* TRIM handling
* Metadata optimization
* Free-space consolidation logic
* Fragmentation analysis correctness
* API behavior

Windows itself avoids classic full-file defragmentation on SSDs except for limited metadata optimization.

---

# Useful NTFS APIs

Advanced testing tools often use these NTFS control codes:

## Retrieval Pointers

```c
FSCTL_GET_RETRIEVAL_POINTERS
```

## Volume Bitmap

```c
FSCTL_GET_VOLUME_BITMAP
```

## Cluster Relocation

```c
FSCTL_MOVE_FILE
```

These are core NTFS interfaces used by many commercial defragmentation products.

---

# Recommended Strategy

For a modern Windows 8–11 defragmentation product:

Use:

* Sysinternals tools for validation and visualization
* Native NTFS APIs for measurement
* A custom fragmentation harness for repeatable testing

Recommended fragmentation scenarios:

* Low free-space fragmentation
* Fragmented free-space testing
* Metadata fragmentation
* Growing database workloads
* VHD/VHDX fragmentation
* Archive rewrite workloads
* Large append-only files

This provides significantly better test coverage than older dedicated fragmentation generators.

```
```
