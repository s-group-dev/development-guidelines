# CHANGELOG

All approved changes to Development Guidelines will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this log versions changes with date in `YYYY-MM-DD` format.

## 2020-03-17 [v1.2.0]
### Added
- Codebase → Version Control → Branching → MUST fork feature (and release) branches from master branch
- Codebase → Version Control → Branching → Mobile Development → SHOULD use fast-forward merges only from feature branch to master branch
- Codebase → Version Control → Branching → Mobile Development → SHOULD implement bug fixes to feature branch and cherry picked them to master and potential release branch
- Codebase → Version Control → Branching → Mobile Development → RECOMMENDED to squash feature branches before merging to master branch
- Codebase → Version Control → Branching → Mobile Development → MUST preserve release tags forever
- Release Management → Mobile Development → MUST use semantic versioning for releases (tags)
- Environments → Data → Mobile Development → SHOULD preserve all release artefacts forever
- Architecture → Infrastructure → SHOULD use semantic versioned Docker images for building releases

## 2020-02-03 [v1.1.0]
### Added
- Codebase → Version Control → MUST use master branch as a base for development
- Release management → SHOULD release to production from branch that's used for base of development
- Release management → MUST have identifiable releases
- Release management → RECOMMENDED to release smaller changes often over larger merges

## 2020-01-21 [v1.0.0]
### Added
- Codebase → Version Control → MUST use version control
- Codebase → Version Control → SHOULD use Git