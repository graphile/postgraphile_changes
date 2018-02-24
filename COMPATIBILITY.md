# Compatibility with v3

By and large we're compatible with PostGraphQL v3.

## New minimum requirements

- Node.js v8.6+ required
- PostgreSQL 9.4+ required
- GraphQL v0.9+ required

## Breaking changes

- `Json` and `Uuid` have been renamed to `JSON` and `UUID` respectively
- `UUID` is enabled by default
- changes to nullables [TODO: expand]
- Custom queries (procedures that return `setof` a table) have reverted to the V2 behaviour of returning the relevant table connection rather than a per-function connection (i.e. the name of the connection has changed)
- Query procedures that return `setof` a scalar no longer have `pageInfo` nor `totalCount`. If this is a problem, raise an issue.
- `orderBy` now accepts an array of enums rather than an individual enum; this shouldn't break Apollo applications (since passing an element instead of an array is valid in GraphQL), but Relay and other GraphQL implementations may have trouble.

## Deprecations

- One-to-one backward relations are now supported (i.e. `create table bar (foo_id int primary key references foo)`) so one-to-one queries now return the record directly rather than a connection (i.e. `barByFooId` rather than previous `barsByFooId`). The old interface is still available, but it is deprecated and you should move to the new single-record API - it's much more efficient.

## Potentially breaking changes

These are things that I doubt affect many people (if any) but I want to raise so you can check your own applications.

- `--watch` now correctly detects dropping elements, but note that the watch schema has changed
- Introspection query has changed
- Field descriptions have changed a little
- Case changing library has been replaced, this doesn't affect any of the tests - if this causes you pain please submit an issue so we can add your fields to the tests to ensure this doesn't happen again
- Procedures that only supported `orderBy: NATURAL` now **do not have `orderBy` at all**.
- `security definer` mutations that return a type from a private schema that the requesting PostgreSQL user is not allowed to view may now result in `permission denied for schema xxxx`
- tables that end in `_input` or `_patch` will no longer be exported as `FooInput` but as `FooInputRecord` - this prevents collisions with mutation types on tables that share the prefix (e.g. `foo`)
- Type names for very large integers and floats (those beyond IEEE754) may have changed (`BigFloat` and `BigInt`)

## Typings

Flow and TypeScript typings are not to be trusted right now. They might work... They might not. This will be resolved as part of an ongoing refactoring effort.
