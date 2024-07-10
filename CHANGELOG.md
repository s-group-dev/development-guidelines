# CHANGELOG

All approved changes to Development Guidelines will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this log versions changes with date in `YYYY-MM-DD` format.

## 2022-06-05 [v2.4.0]
### Added
#### Development Guidelines
- Architecture → Security → SHOULD conduct threat modelling when the security model of the software changes
### Changed
#### Development Guidelines
- Architecture → Security → MUST run automated vulnerability for code `{+and fix or mitigate the findings+}`
- Architecture → Security → MUST restrict `{+unnecessary+}` access to `[-development-]` environments `{+and endpoints+}` from the open internet

## 2022-04-29 [v2.3.1]
### Changed
#### Development Guidelines
- Quality Assurance → Automation → RECOMMENDED to run tests for all code changes `{+as part of CI/CD pipeline+}`

## 2022-04-29 [v2.3.0]
### Added
#### Development Guidelines
- Operations → Monitoring → SHOULD provide uptime metric(s) for a service
- Quality Assurance → SHOULD have documented test strategy
- Quality Assurance → MUST have strategy for test automation and automatic tests designed based on it
- Quality Assurance → Automation → SHOULD develop, use and share common solutions (at least) internally for test automation
- Quality Assurance → Automation → RECOMMENDED  to consider existing solutions before looking for a new one
## Removed
#### Development Guidelines
- Quality Assurance → Automation → MUST have some automatic tests for the service that are repeatable
- Quality Assurance → Documentation → SHOULD have documented test strategy and which parts of codebase are tested

## 2022-03-16 [v2.2.0]
### Added
#### Development Guidelines
- Architecture → Compliance → MUST document the application architecture, personal data flows and needed security measures to ensure compliance with business, privacy and information security requirements
- Architecture → Compliance MUST be able to erase (or anonymize) all (or partial) personal data on expiration or when requested by data subject
- Architecture → MUST make your technology choices visible in SOK's Tech Radar

## 2022-02-04 [v2.1.0]
### Added
#### Development Guidelines
- Architecture → Compliance → MUST ensure that company policy regarding cookie classification and consents are followed (if applicable)
- Architecture → Compliance → MUST document all personal data used in testing and development, backups and log data
- Architecture → Compliance → MUST have required monitoring functionalities concerning usage of personal data based on data classification
- Architecture → Compliance → MUST ensure that only necessary personal data will be collected and/or processed
- Architecture → Compliance → MUST implement functionality for defining retention times for all personal data

## 2022-02-01 [v2.0.1]
### Changed
#### Development Guidelines
Start using main as a base for development.
- Codebase → Version Control → MUST use `[-master-]{+main+}` branch as a base for development
- Codebase → Version Control → Branching → MUST fork feature (and release) branches from `[-master-]{+main+}` branch
- Codebase → Version Control → Branching → Mobile Development → SHOULD use fast-forward merges only from feature branch to `[-master-]{+main+}` branch
- Codebase → Version Control → Branching → Mobile Development SHOULD implement bug fixes to feature branch and cherry picked them to `[-master-]{+main+}` and potential release branch
- Codebase → Version Control → Branching → Mobile Development RECOMMENDED to squash feature branches before merging to `[-master-]{+main+}` branch
- Release Management → SHOULD release to production from `[-branch that's used for base of development-]{+main (trunk)+}` 

## 2021-09-13 [v2.0.0]
### Added
#### Development Guidelines
- Codebase → Architecture → MUST follow common API Guidelines
#### API Guidelines
- Principles → RECOMMENDED to read Zalando RESTful API and Event Guidelines as a base and use as a reference
- Principles → SHOULD implement versioning
- Principles → MUST have versioning strategy decided prior the first release
- Principles → RECOMMENDED not use URL versioning
- Principles → RECOMMENDED to use HTTP Headers to carry version information
- Principles → RECOMMENDED have version information also in response headers
- Principles → MUST not break backward compatibility once the version has been released

## 2021-09-08 [v1.9.0]
### Added
- Architecture → Infrastructure → MUST encrypt data at rest in cloud
- Architecture → Infrastructure → MUST rotate encryption keys every 365 days (that are used for data at rest) in cloud 
- Architecture → Infrastructure → MUST have billing alerts in cloud
- Architecture → Infrastructure → SHOULD have infrastructure as code
- Architecture → Infrastructure → MUST have repeatable infrastructure
- Architecture → Security → MUST restrict access to development environments from the open internet

## 2021-04-28 [v1.8.0]
### Added
- Architecture → Infrastructure -> MUST use tags on cloud resources
- Architecture → Infrastructure -> MUST have all virtual machines managed by CSP's instance management service (AWS Systems Manager, Azure Automanage, ...)
- Architecture → Infrastructure -> SHOULD use cloud managed services whenever possible
- Architecture → Infrastructure → MUST have periodical OS updates for all services not managed by cloud
- Architecture → Infrastructure → MUST document manually managed virtual machines' maintenance and security processes
- Environment → Design → SHOULD follow the Principle of Least Privilege

## 2020-11-24 [v1.7.0]
### Added
- Codebase → Coding Standards → SHOULD use automatic code style checking (linting)
- Codebase → Architecture → MUST have only needed components in production (resources, interfaces, dependencies)
- Architecture → MUST document all intentionally integrated 3rd party provided services used by the application
- Architecture → MUST document selected development management tools and purpose of tools
- Quality Assurance → Automation → MUST have some automatic tests for the service that are repeatable
- Quality Assurance → Automation → RECOMMENDED to run tests for all code changes
- Quality Assurance → Documentation → SHOULD have documented test strategy and which parts of codebase are tested

## 2020-11-10 [v1.6.0]
### Added
- Codebase → Peer Review → MUST have a process for peer review
- Codebase → Peer Review → SHOULD have another developer to approve code changes before executed in production
- Codebase → Coding Standards → RECOMMENDED use automatic code formatting

## 2020-10-07 [v1.5.0]
### Added
- Operations → Monitoring → MUST have monitoring
- Operations → Monitoring → MUST have alarms
- Guidance → Documentation → MUST have a documented disaster recovery plan
- Environments → Design → MUST have production separated from testing environments
- Architecture → Infrastructure → MUST have centralised logging
- Architecture → Infrastructure → SHOULD collect logs from all deployed environments

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
