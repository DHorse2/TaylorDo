# Architecture

TaylorDo is currently implemented as a MyDefrag-based Windows optimization system.

Long term, the project should separate:

- The TaylorDo storage architecture.
- The classification model.
- The scheduling model.
- The safety policies.
- The implementation engine.

This allows MyDefrag to remain the initial engine while future engines may be implemented in Rust or another systems language.

## Conceptual Model

```text
TaylorDo Project
├── Mission
├── Design Science
├── Storage Model
├── Classification Engine
├── Scheduler
├── User Tooling
├── Documentation
└── Engines
    ├── MyDefrag Engine
    └── Future Rust Engine
```
