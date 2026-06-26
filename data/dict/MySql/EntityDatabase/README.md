# EntityDatabase

MySQL database assets for the Global Entity Database.

## Layout

- `schema/` contains database and table definitions. `Create_Database.sql` creates the database container, `Create_ContactTable.sql` is the current primary table definition, and `Bootstrap_Database.sql` preserves the full experimental bootstrap script.
- `migrations/` contains ordered database changes that can be applied incrementally.
- `seeds/dev/` contains non-production sample data for local development.
- `seeds/reference/` contains controlled reference data such as country lists, entity types, or lookup values.
- `views/` contains reusable view definitions split one view per SQL file.
- `procedures/` contains stored procedure definitions split one procedure per SQL file.
- `functions/` contains stored function definitions.
- `scripts/` contains repeatable database maintenance scripts such as local bootstrap and reset operations.
- `docs/` contains database design notes, ERD notes, and naming conventions.
- `backups/` contains local backup output and should not contain committed dump files.
- `exports/` contains generated exports and should not contain committed dump files.

## Conventions

- Keep SQL source files in version control.
- Keep generated dumps, backups, and exports out of version control.
- Use numbered migration files for changes that should be applied in order.
- Do not commit credentials or machine-specific connection strings.
