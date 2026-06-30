# Development Standards – Naming Conventions

## Purpose

Consistent naming improves readability, maintainability, discoverability, and automation.

These standards are intended to be independent of any particular programming language, operating system, framework, or technology stack.

The objective is not absolute uniformity, but predictable and meaningful naming throughout a project.

---

# General Principle

Choose names that describe **what something is**, rather than simply **what it contains**.

Directories, files, modules, namespaces, and classes should represent concepts, domains, responsibilities, or collections in a consistent manner.

---

# Collection Rule

Plural names should be reserved primarily for collections.

A collection contains multiple independent items of the same general type.

Examples include:

* `docs/`
* `tests/`
* `examples/`
* `samples/`
* `scripts/`
* `images/`
* `assets/`
* `fonts/`
* `logs/`

These names have become widely accepted conventions and should generally be preserved.

---

# Concept Rule

Singular names should be used for concepts, domains, subsystems, and responsibilities.

Examples include:

* `design/`
* `history/`
* `research/`
* `developer/`
* `user/`
* `engine/`
* `parser/`
* `scheduler/`
* `database/`
* `website/`

These directories represent a single logical area rather than a collection of unrelated objects.

---

# Business Domains

Business entities should normally use singular names.

Examples:

* `customer/`
* `product/`
* `invoice/`
* `order/`
* `employee/`
* `supplier/`

These names correspond naturally to software architecture and domain models.

---

# Source Code

Packages, namespaces, and source directories should generally use singular names because each represents a single subsystem or responsibility.

Examples:

* `engine`
* `parser`
* `compiler`
* `scheduler`
* `database`
* `filesystem`

---

# Documentation

Use the industry-standard `docs/` directory.

Although "documentation" is a collective noun, `docs/` has become the widely recognized convention within software projects and should normally be preferred over `doc/`.

Within the documentation hierarchy, use singular names for conceptual sections.

Example:

```text
docs/
    design/
    developer/
    history/
    outreach/
    research/
    user/
```

---

# Multiple Implementations

When a directory genuinely contains multiple independent implementations, a plural name is appropriate.

Example:

```text
engines/
    mydefrag/
    rust/
```

The parent directory is plural because it contains multiple engines.

Each implementation beneath it remains singular.

---

# Naming Objectives

Good names should be:

* Clear.
* Predictable.
* Stable.
* Self-explanatory.
* Independent of implementation details.

Avoid abbreviations unless they are universally understood within the project or industry.

---

# Consistency Over Preference

Many naming choices are subjective.

Once a project adopts a convention, consistency becomes more important than individual preference.

Future contributors should be able to predict names without consulting documentation.

---

# Summary

The preferred convention is:

* **Plural** for collections.
* **Singular** for concepts, domains, responsibilities, and subsystems.
* Use established industry conventions where they exist (for example, `docs/`).

The guiding question should always be:

> **"Is this a collection of things, or is it a single concept?"**

The answer determines whether the name should normally be plural or singular.
