# Design Science – Architectural Design Using a Minimal Domain-Specific Language

## Purpose

This document examines how complex software architecture can be constructed using a highly constrained domain-specific language (DSL). TaylorDo serves as a practical example of applying software engineering principles in an environment where conventional programming constructs are largely unavailable.

The objective is not to demonstrate language capability, but to demonstrate architectural capability.

## Problem Statement

Modern software development often assumes the availability of expressive programming languages that include:

- Conditional execution
- Iteration
- Functions and procedures
- User-defined data structures
- Recursion
- Exception handling
- Dynamic memory management

These features simplify software development but are not prerequisites for building sophisticated systems.

Many embedded systems, configuration languages, automation frameworks, and domain-specific languages intentionally provide only a limited set of operations.

The question is therefore:

> How much architectural complexity can be achieved using a deliberately limited language?

## The MyDefrag Scripting Language

The MyDefrag scripting language is intentionally small and specialized.

Among its limitations are the absence of many constructs commonly found in general-purpose programming languages, including:

- General-purpose `if` statements
- `else`
- `switch`
- `for`
- `while`
- User-defined functions
- Recursion

Instead, the language provides a deterministic sequence of domain-specific operations designed specifically for disk optimization.

## Architectural Response

TaylorDo approaches these limitations as design constraints rather than obstacles.

Instead of relying on increasingly expressive language features, the system is organized around:

- Composition of reusable script modules.
- Clearly defined maintenance stages.
- Separation of responsibilities.
- Deterministic execution.
- Declarative configuration.
- Data organization rather than procedural complexity.

As a result, sophisticated behavior emerges from the interaction of relatively simple components.

## Composition Instead of Conditionals

Many software systems solve problems through conditional logic.

TaylorDo instead emphasizes composition.

Each script performs a specific responsibility.

Larger maintenance strategies are created by assembling these scripts into predictable execution sequences.

The overall behavior of the system is therefore determined primarily by architecture rather than branching logic.

## Deterministic Execution

Because execution paths are largely predetermined, system behavior becomes highly predictable.

Advantages include:

- Repeatable execution.
- Simplified testing.
- Easier verification.
- Reduced implementation complexity.
- Improved maintainability.

Deterministic execution is particularly valuable in maintenance software where predictable results are often more important than runtime flexibility.

## Domain-Specific Design

The scripting language focuses exclusively on storage optimization.

This specialization removes much of the complexity required by general-purpose programming languages while allowing the language to remain concise and understandable.

TaylorDo builds upon this specialization by organizing optimization policies rather than implementing general computation.

## Engineering Principles

Several software engineering principles become particularly important when working within a constrained language.

### Separation of Concerns

Each script has a clearly defined responsibility.

Responsibilities are combined through organization rather than embedded control logic.

### Modularity

Large optimization policies are assembled from smaller reusable components.

### Configuration Over Programming

Behavior is determined primarily through configuration and script composition rather than increasingly complex procedural logic.

### Predictability

Reducing dynamic behavior simplifies reasoning about system execution.

## Educational Perspective

Minimal languages provide useful educational examples because they separate architectural thinking from language features.

Students can observe that:

- Architecture is independent of programming language richness.
- Good decomposition reduces the need for complex control structures.
- Software quality depends upon organization as much as implementation.
- Domain-specific languages encourage different design approaches than general-purpose languages.

These observations are applicable well beyond storage optimization.

## Limitations

A constrained language also introduces trade-offs.

Compared with general-purpose programming languages, a minimal DSL may:

- Require more planning.
- Encourage static rather than dynamic behavior.
- Reduce implementation flexibility.
- Shift complexity from code toward system architecture.

These trade-offs are intentional design decisions rather than shortcomings.

## Design Summary

TaylorDo demonstrates an important principle of software engineering:

> Architectural sophistication does not require a highly expressive programming language.

A constrained domain-specific language can support complex, maintainable, and predictable systems when the overall architecture emphasizes composition, modularity, organization, and clear separation of responsibilities.

The resulting design illustrates that software architecture is determined not only by the capabilities of the implementation language, but by the engineering principles used to organize the system.
