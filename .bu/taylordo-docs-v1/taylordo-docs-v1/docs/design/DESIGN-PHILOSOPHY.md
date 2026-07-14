# Design Philosophy

## Primary Statement

TaylorDo is an open engineering project dedicated to advancing the science and practice of workload-oriented storage organization.

## The Architecture is the Product

TaylorDo begins as a MyDefrag-based Windows implementation, but its long-term architecture should be engine-independent.

The storage model, classification system, workload architecture, Design Science, documentation, and community are all part of the project.

The engine is one implementation of the architecture.

## Implementation Independence

The current MyDefrag implementation may be understood as an initial engine.

A future Rust implementation, Windows engine, Linux analyzer, or Linux optimizer may implement the same TaylorDo architecture in a different technical environment.

This requires a future TaylorDo Architecture Specification that defines:

- Workload classes.
- Storage zones.
- Classification rules.
- Scheduling philosophy.
- Locality principles.
- Safety rules.
- SSD policy.
- Optimization objectives.

The specification should describe what a TaylorDo engine must do without binding the architecture to MyDefrag or Rust.

## Documentation as Architecture

Software often preserves what was built while losing why it was built.

TaylorDo therefore treats documentation as part of the architecture.

The Design Science collection records the rationale behind the storage architecture, workload-oriented organization, software design, and long-term direction of the project.

Future implementations may differ in programming language, operating system, or optimization engine.

The engineering principles documented here are intended to remain stable and continue guiding those implementations.

## Engineering Over Marketing

TaylorDo should avoid vague claims about being a modern PC speed booster.

Performance gains depend on system condition, fragmentation, disk fullness, and workload. The strongest claims are those that can be tested and defended.

TaylorDo is designed to restore lost HDD performance, maintain storage organization, and support systems that continue to rely on mechanical hard disk drives.
