# Future Rust Direction

A Rust implementation should be treated as a future research and architecture track rather than an immediate replacement.

## Roadmap

### Phase 1: TaylorDo / MyDefrag

- Finish the Windows product.
- Complete installer.
- Complete documentation.
- Publish website.
- Build community.

### Phase 2: TaylorDo Core Model

- Formalize zones.
- Formalize workload categories.
- Formalize drive roles.
- Define storage classification rules independent of MyDefrag.

### Phase 3: Rust Prototype

- Implement scanner/classifier in Rust.
- Produce reports first.
- Do not move files initially.
- Validate zone logic safely.

### Phase 4: Windows Rust Engine

- Explore Windows defrag APIs.
- Reproduce TaylorDo placement model.
- Compare with MyDefrag results.

### Phase 5: Linux Rust Research

- Study ext4, XFS, Btrfs behavior.
- Determine what file movement/control is actually possible.
- Treat Linux version as a separate engineering problem.

## Principle

TaylorDo should first define the storage architecture independently of the engine.

The real intellectual property is the classification model, workload-oriented zone architecture, scheduling model, and safety policy.
