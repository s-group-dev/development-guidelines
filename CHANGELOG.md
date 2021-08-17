# CHANGELOG

All approved changes to Development Guidelines will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this log versions changes with date in `YYYY-MM-DD` format.

## 2020-10-02 [v1.4.0]
### Added
- Architecture → Security → MUST run automated vulnerability checks for code
- Architecture → Security → SHOULD run automated static code analysis for code quality
- Guidance → MUST have process how to handle security notifications
- Codebase → Version Control → MUST have documented version control flow
- Codebase → Version Control → Branching → SHOULD protect default branch from pushes
- Codebase → Coding Standards → MUST agree on a coding standard inside a team

## 2020-06-17 [v1.3.0]
### Added
- Release Management → MUST have (at least) following stages in pipeline (in recommended order): install, test, scan, build, deploy, verify, release
- Environments → Design → SHOULD name AWS profiles after account-aliases
- Guidance → Documentation → SHOULD use README.md as a central information document inside code repository
- Guidance → Documentation → SHOULD document all exceptions with reasoning from Development Guidelines in project's README.md

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