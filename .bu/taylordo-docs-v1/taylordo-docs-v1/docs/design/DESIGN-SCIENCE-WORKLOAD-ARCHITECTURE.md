# Design Science – Workload-Oriented Storage Architecture

## Purpose

TaylorDo is founded on the principle that a hard disk drive should be organized to optimize the execution of complete workloads rather than individual files.

Traditional defragmentation improves file continuity. Traditional zoning improves the placement of broad categories of files. TaylorDo extends these concepts by organizing related resources into a coherent storage architecture that reflects how Windows systems actually operate.

The objective is to reduce the cumulative mechanical costs of executing common workloads over the lifetime of the storage system.

## The Fundamental Observation

A computer rarely accesses a single file in isolation.

Most meaningful work consists of coordinated access to groups of related resources.

Starting an application, compiling software, opening a document, rendering a video, or launching a game all require the operating system to retrieve many files that work together.

The performance experienced by the user therefore depends not only on the location of individual files, but also on the physical organization of the entire working set.

## Workloads Rather Than Files

Traditional optimization often considers files as independent objects.

TaylorDo instead considers workloads.

A workload consists of related files that are commonly accessed together while performing a particular activity.

Examples include:

- Operating system startup.
- Application launch.
- Software development.
- Office productivity.
- Multimedia editing.
- Scientific computing.
- Gaming.
- Backup and archival operations.

The objective is to minimize the total mechanical effort required to perform these workloads.

## Locality of Reference

TaylorDo applies the computer science principle of locality of reference to physical storage.

Resources that are expected to participate in the same workload are placed in close physical proximity whenever practical.

Examples include:

- Executable programs and their supporting libraries.
- Applications and their configuration files.
- Frequently used application data located near the applications that consume it.
- Developer toolchains positioned near source code, build products, and supporting libraries.
- Games organized with their executable components, configuration data, and frequently accessed assets.

Reducing the physical distance between related resources decreases average seek distance and reduces cumulative head movement during normal operation.

## Fine-Grained Storage Classification

TaylorDo organizes Windows systems through detailed classification.

Rather than dividing the storage device into only a few broad regions, the disk is progressively organized into numerous functional zones representing distinct categories of data.

Examples include:

- Windows operating system.
- Shared system libraries.
- Installed applications.
- Developer environments.
- Source code.
- Build products.
- User documents.
- Multimedia.
- Temporary files.
- Backup data.
- Archives.

Each category is assigned to a storage region that reflects its expected access characteristics.

## Progressive Zone Construction

The storage architecture is constructed through multiple optimization passes.

Each pass identifies a particular category of files and progressively builds the final storage organization.

The completed layout is therefore the result of successive refinement rather than a single relocation operation.

This layered organization produces a structured storage system whose physical layout reflects functional relationships between data.

## Multi-Use System Design

Modern Windows systems rarely perform only one task.

A single computer may simultaneously serve as:

- A development workstation.
- A gaming platform.
- An office computer.
- A multimedia workstation.
- A personal archive.
- A research environment.

TaylorDo is designed for these mixed-use environments.

Instead of optimizing exclusively for one activity, it applies a generalized organization model that accommodates multiple workloads within a single coherent storage architecture.

This allows the storage system to perform efficiently across a broad range of day-to-day activities without requiring separate optimization strategies for each user profile.

## System-Centric Engineering

TaylorDo views the storage device as an integrated system.

Performance emerges from the organization of relationships between files rather than the optimization of isolated objects.

This systems-oriented perspective influences every aspect of the storage architecture, including classification, zone construction, scheduling, and long-term maintenance.

## Engineering Principles

The workload-oriented architecture is guided by several principles:

- Organize systems rather than files.
- Optimize workloads rather than individual operations.
- Preserve locality of reference.
- Reduce cumulative mechanical movement.
- Build storage organization progressively.
- Maintain organization through scheduled preventive maintenance.
- Design for mixed-use Windows environments.
- Produce repeatable and deterministic layouts.

## Design Summary

TaylorDo extends traditional defragmentation into a broader discipline of storage architecture.

Its objective is not merely to eliminate fragmentation, but to construct and preserve a physical organization that reflects the functional relationships between the components of a Windows system.

By organizing workloads rather than isolated files, TaylorDo seeks to reduce mechanical access costs, improve long-term responsiveness, and provide a generalized optimization model suitable for the diverse ways in which modern Windows computers are used.

Storage is not simply a collection of files.

It is an organized system whose physical structure influences the performance of the workloads it supports.
