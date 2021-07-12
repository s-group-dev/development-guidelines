# Contributing

## Pull requests only

*DON'T* push to the master branch directly. Always use pull requests and have at least two reviewer approvals.

## Versioning

When adding new changes, one should always also add an entry to changelog.

While doing so, please respect the following scheme:

- Adding a new rule increases MINOR version
- Modifying some existing rule, but not changing its semantics increases PATCH version
-  When doing incompatible changes, eg. moving existing rules from section to another, increase MAJOR version

Versioning has `v` prefix and starts from `v1.0.0`.