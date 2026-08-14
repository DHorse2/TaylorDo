# Volume Management Architecture

## Principle

Volume Management is **standalone first and MCP enabled**.

The PowerShell module:

- has no runtime dependency on MCP;
- owns enough configuration and metadata to operate independently;
- exposes stable public PowerShell commands;
- can be invoked from batch files;
- can later be wrapped by an MCP adapter without changing its standalone behavior.

## Scope

Version 0.1 provides:

- local volume inventory;
- machine-specific storage roots;
- daily, weekly, monthly, and yearly backup runs;
- permanent named archive points;
- Robocopy-based transfer;
- incomplete-run isolation with `.creating` directories;
- JSON run metadata;
- JSON Lines manifests;
- optional SHA-256 verification;
- retention processing;
- restore planning and execution;
- an exported MCP capability descriptor.

## Separation of concerns

The module does not own:

- filesystem indexing;
- link repair;
- synchronization;
- storage optimization algorithms;
- MCP transport;
- centralized cross-application state.

Those capabilities may be integrated through future adapters and shared contracts.

## Run lifecycle

1. Resolve the machine-specific destination.
2. Create a `.creating` run directory.
3. Copy each configured source.
4. Generate a manifest.
5. Mark the run complete.
6. Atomically rename the run directory to its final name.
7. Leave failed runs marked as failed for diagnosis.

## Safety

- Backup creation does not use Robocopy `/MIR`.
- Archive runs never expire automatically.
- Restore does not overwrite newer or existing files unless `-Overwrite` is supplied.
- Destructive retention and restore operations support `-WhatIf`.
