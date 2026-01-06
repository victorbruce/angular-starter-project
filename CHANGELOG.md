# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [1.1.0](https://github.com/victorbruce/angular-starter-project/compare/v1.0.3...v1.1.0) (2026-01-06)

### ✨ Features

- add Angular Material with custom theming ([bc69489](https://github.com/victorbruce/angular-starter-project/commit/bc69489d99fd7e2311dd8c6cc539a6c6dc4eb7c6)), closes [#F0B90](https://github.com/victorbruce/angular-starter-project/issues/F0B90) [#0ECB81](https://github.com/victorbruce/angular-starter-project/issues/0ECB81) [#F6465](https://github.com/victorbruce/angular-starter-project/issues/F6465)

### [1.0.3](https://github.com/victorbruce/angular-starter-project/compare/v1.0.2...v1.0.3) (2025-12-24)

### 🔧 Chores

- optimize deployment to trigger only on version tags ([5412f37](https://github.com/victorbruce/angular-starter-project/commit/5412f3746674ee4bfa903279c9b1f1b8925eb3d2))

### [1.0.2](https://github.com/victorbruce/angular-starter-project/compare/v1.0.1...v1.0.2) (2025-12-23)

### 👷 CI/CD

- update CI workflows to run only on PRs to main and remove dev references ([c254400](https://github.com/victorbruce/angular-starter-project/commit/c254400785aa6ec7d7d31b254439dd1320903047))

### 🔧 Chores

- add standard-version for automated releases ([a93750f](https://github.com/victorbruce/angular-starter-project/commit/a93750f946034162e80fbf2a746c9f426f83356b))

### 🐛 Bug Fixes

- remove incorrect conditional from build step ([b7e5923](https://github.com/victorbruce/angular-starter-project/commit/b7e59235de863a33b41c03697a330e02fa63e423))

## [1.0.0](https://github.com/victorbruce/angular-starter-project/releases/tag/v1.0.0) (2024-12-22)

### ✨ Features

- **ci**: implement Docker CI/CD pipeline
- **ci**: add automated deployment to Render
- **docker**: dockerize Angular application with multi-stage builds
- **docker**: add docker-compose for local development
- **config**: setup branch protection rules

### 📚 Documentation

- add comprehensive README with Docker and CI/CD guides
- create setup instructions for new developers

### 🔨 Build System

- configure GitHub Actions workflows
- setup ESLint and Prettier
- add Husky pre-commit hooks

---

**This is the initial production release with full CI/CD automation.**
