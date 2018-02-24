# PostGraphile Changes

This repository is to help me (@Benjie) quantify the differences between
PostGraphQL v3 and PostGraphile v4.

## Performance

Performance is checked against a shared database with well defined data to make
the tests reproducible.

We disregard the first 100 queries to allow the Node.js JIT to warm up.
