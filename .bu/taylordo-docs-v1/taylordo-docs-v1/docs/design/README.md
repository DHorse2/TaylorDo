# Design Science

TaylorDo is founded on the belief that hard disk optimization is a systems engineering discipline rather than a single maintenance operation.

Traditional disk utilities often define success as completing a defragmentation pass. TaylorDo adopts a broader objective: to restore, organize, and maintain storage systems so they continue to perform efficiently throughout their operational lifetime.

The Design Science documents describe the engineering principles that guide TaylorDo. They explain not only what the software does, but why it does it.

## Core Principles

### Organization is More Important than Defragmentation

Removing fragmentation is only the beginning.

An optimized hard disk should also organize data so that performance-critical files occupy performance-optimal locations, related files are grouped together, and free space supports future operation.

Defragmentation restores continuity.

Organization restores efficiency.

### Maintenance is Preventive Engineering

Performance degradation occurs gradually.

Rather than waiting for noticeable slowdowns, TaylorDo encourages scheduled maintenance that prevents degradation from accumulating.

Preventive maintenance is more effective, more predictable, and less disruptive than corrective maintenance.

### Automation Improves Reliability

Maintenance that depends on users is eventually forgotten.

Automation provides consistency, repeatability, and measurable results while reducing administrative effort.

### Different Storage Technologies Require Different Strategies

Mechanical hard disk drives and solid-state drives have fundamentally different physical characteristics.

TaylorDo applies optimization techniques appropriate for HDDs while avoiding unnecessary operations on SSDs.

### Engineering Over Marketing

TaylorDo avoids exaggerated claims.

Performance improvements depend upon the condition of the storage device before optimization.

Systems suffering from severe fragmentation and poor file organization generally benefit the most.

Well-maintained systems may experience only modest improvements.

The objective is to restore lost performance, not promise unrealistic gains.

## Secondary Design Principle – Document the Reasoning

TaylorDo recognizes that software preserves implementation but does not necessarily preserve understanding.

Architecture is shaped by many engineering decisions, assumptions, trade-offs, and observations that are often lost over time. Future developers may therefore understand what the software does without understanding why particular design decisions were made.

To address this, TaylorDo documents not only its implementation but also the reasoning behind its architecture.

The Design Science collection records the principles that guided the project, including storage organization, workload-oriented optimization, software architecture, scheduling philosophy, and long-term engineering objectives.

This documentation is intended to evolve alongside the software.

Future implementations may differ in programming language, operating system, or optimization engine, but they should continue to be informed by clearly documented engineering principles.

Documenting design decisions is therefore viewed as an important part of maintaining the long-term integrity of the project.

## Documents

- [Performance](DESIGN-SCIENCE-PERFORMANCE.md)
- [Storage Organization](DESIGN-SCIENCE-STORAGE-ORGANIZATION.md)
- [Workload-Oriented Storage Architecture](DESIGN-SCIENCE-WORKLOAD-ARCHITECTURE.md)
- [Architectural Design Using a Minimal DSL](DESIGN-SCIENCE-MINIMAL-DSL.md)
- [Modern HDD Architecture](DESIGN-SCIENCE-MODERN-HDD-ARCHITECTURE.md)
- [Engineering Mature Technologies](DESIGN-SCIENCE-ENGINEERING-MATURE-TECHNOLOGIES.md)
- [Design Philosophy](DESIGN-PHILOSOPHY.md)
