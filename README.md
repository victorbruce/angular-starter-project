# Angular Starter Project 🚀

A comprehensive, production-ready Angular 20 starter project with Docker support for rapid project scaffolding. This kit comes pre-configured with enterprise-level tools including state management, UI component libraries, testing frameworks, and automated code quality tools.

[![Angular](https://img.shields.io/badge/Angular-20-red.svg)](https://angular.io/) [![Node](https://img.shields.io/badge/Node-22-green.svg)](https://nodejs.org/) [![Docker](https://img.shields.io/badge/Docker-Ready-blue.svg)](https://www.docker.com/) [![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://claude.ai/chat/LICENSE)

Live URL: [link](some url)

---

## 📌 Table of Contents

- [🎯 Features](#-features)
- [🚀 Getting Started](#-getting-started)
- [🛠️ Tech Stack](#-tech-stack)
- [📦 Installation Methods](#-installation-methods)
- [💻 Running the Application](#-running-the-application)
- [🐳 Docker Commands](#-docker-commands)
- [🧪 Testing & Code Quality](#-testing-&-code-quality)
- [📋 Project Approach](#-project-approach)
- [🚀 Deployment](#-deployment)
- [🤝 Team Onboarding](#-team-onboarding)
- [👤 Author](#-author)

---

## 🎯 Features

- ✅ **Angular 20** with standalone components and latest best practices
- ✅ **Docker Development Environment** (no local Node.js needed!)
- ✅ **Hot Reload** configured for Docker volumes
- ✅ **Production-Ready** Nginx setup with multi-stage builds
- ✅ **NgRx** for robust state management (Store, Effects, Entities)
- ✅ **Angular Material** UI component library
- ✅ **Jest** for unit and integration testing
- ✅ **ESLint & Prettier** with automated code formatting
- ✅ **Husky** pre-commit hooks for code quality enforcement
- ✅ **TypeScript Strict Mode** enabled
- ✅ **SCSS** for powerful, maintainable styling
- ✅ **Automatic Project Renaming** via setup scripts
- ✅ **Scalable folder structure** for enterprise applications

---

## 🚀 Getting Started

### Prerequisites

**Choose Your Path:**

#### Option A: Docker Path (Recommended for Teams)

- **Docker Desktop** - [Download here](https://www.docker.com/products/docker-desktop)
- That's it! No Node.js or Angular CLI needed locally.

#### Option B: Traditional Development

- **Node.js**: `^20.19.0`, `^22.12.0`, or `^24.0.0` (LTS recommended)
- **Angular CLI**: Version 20+ (`npm install -g @angular/cli`)
- **npm**: Comes bundled with Node.js

---

## 🛠️ Tech Stack

This project is built with a modern, scalable, and maintainable tech stack:

| Category             | Technology                      |
| -------------------- | ------------------------------- |
| **Framework**        | Angular 20                      |
| **Language**         | TypeScript                      |
| **Styling**          | SCSS & Angular Material         |
| **State Management** | NgRx (Store, Effects, Entities) |
| **Testing**          | Jest (Unit & Integration)       |
| **Linting**          | ESLint & Prettier               |
| **Git Hooks**        | Husky                           |
| **Containerization** | Docker & Docker Compose         |
| **Web Server**       | Nginx (Production)              |

---

## 📦 Installation Methods

### Method 1: Using as a Template (⚡ Fastest)

#### Option A: Using `degit`

```bash
# Install degit globally (one-time)
npm install -g degit

# Create new project from this template
degit victorbruce/angular-starter-project my-new-project

# Navigate to project
cd my-new-project

# Run setup script to rename project
./setup.sh my-new-project        # Mac/Linux
.\setup.ps1 my-new-project       # Windows PowerShell

# Start development with Docker
docker-compose up

```

#### Option B: Using GitHub Template Button

1.  Click "Use this template" button on GitHub
2.  Name your new repository
3.  Clone and run setup script
4.  `docker-compose up`

### Method 2: Traditional Clone

```bash
# 1. Clone the repository
git clone https://github.com/victorbruce/angular-starter-project
cd angular-starter-project

# 2. Install dependencies (if not using Docker)
npm install

```

---

## 💻 Running the Application

### 🐳 Docker Development (Recommended)

**For New Team Members - Zero Local Setup Required!**

```bash
# Start development server with hot reload
docker-compose up angular-dev

```

**Access your app:** http://localhost:4200

Changes to your code will automatically reload! ✨

### 💻 Traditional Development

```bash
# Start development server
ng serve

# Or using npm
npm start

```

**Access your app:** http://localhost:4200

The application will automatically reload when you change source files.

---

## 🐳 Docker Commands

### Development Mode (with Hot Reload)

```bash
# Start development server
docker-compose up angular-dev

# Run in background
docker-compose up -d angular-dev

# View logs
docker-compose logs -f angular-dev

# Stop services
docker-compose down

```

### Production Mode (Testing Production Build)

```bash
# Build and run production version
docker-compose up angular-prod

```

**Access production build:** http://localhost:8080

### Running Angular CLI Commands Inside Docker

```bash
# Generate a new component
docker-compose exec angular-dev ng generate component features/my-component

# Generate a service
docker-compose exec angular-dev ng generate service core/services/my-service

# Generate NgRx store
docker-compose exec angular-dev ng generate @ngrx/schematics:store State --root --module app.config.ts

# Install npm packages
docker-compose exec angular-dev npm install lodash
docker-compose exec angular-dev npm install --save-dev @types/lodash

# Run tests
docker-compose exec angular-dev npm test

# Run linter
docker-compose exec angular-dev npm run lint

```

### Access Container Shell

```bash
# Open interactive shell in running container
docker-compose exec angular-dev sh

# Now you can run any command
ng --version
npm list

```

### Docker Build Commands

```bash
# Build development image
docker build --target development -t angular-starter:dev .

# Build production image
docker build --target production -t angular-starter:prod .

# Clean up unused Docker resources
docker system prune -a

```

---

## 🧪 Testing & Code Quality

### Running Tests

This project uses **Jest** for fast, reliable unit testing:

```bash
# Run tests (traditional)
npm test

# Run tests (Docker)
docker-compose exec angular-dev npm test

# Run tests in watch mode
npm run test:watch

# Run tests with coverage
npm run test:coverage

```

### Linting and Formatting

Automated code quality with **ESLint** and **Prettier**:

```bash
# Run linter and auto-fix issues
npm run lint:fix

# Format entire codebase
npm run format

# Check formatting without changes
npm run format:check

```

### Pre-commit Hooks

**Husky** automatically runs before each commit:

- ✅ Lints staged files
- ✅ Formats code
- ✅ Runs affected tests
- ❌ Blocks commits with errors

This ensures only clean, tested code enters the repository.

---

## 📋 Project Approach

This starter project is built with key principles to ensure scalability, maintainability, and code quality:

### 🏗️ Architecture Principles

#### **1\. Robust State Management (NgRx)**

NgRx was chosen for its Redux-inspired pattern, providing:

- **Single source of truth** for application state
- **Predictable state updates** through actions and reducers
- **Time-travel debugging** with Redux DevTools
- **Scalability** for complex applications
- **Large community** with excellent documentation

Compared to service-based state management, NgRx offers better debugging capabilities and a more maintainable structure for large-scale applications.

#### **2\. Automated Code Quality**

Pre-configured with:

- **Husky**: Git hooks for pre-commit checks
- **ESLint**: JavaScript/TypeScript linting
- **Prettier**: Automatic code formatting

These tools enforce consistent coding standards and prevent unclean code from being committed, reducing code review time and maintaining high code quality across teams.

#### **3\. Scalable Project Structure**

```bash
src/
├── app/
│   ├── core/              # Singleton services, guards, interceptors
│   ├── shared/            # Reusable components, directives, pipes
│   ├── features/          # Feature modules (lazy-loaded)
│   ├── store/             # NgRx state management
│   └── models/            # TypeScript interfaces and types
├── assets/                # Static files
└── environments/          # Environment configurations

```

This organization makes it intuitive to:

- Locate files quickly
- Understand where to place new code
- Scale to hundreds of components

#### **4\. Lean, Powerful Styling (SCSS)**

SCSS provides:

- **Variables and mixins** for consistent theming
- **Nesting** for better organization
- **Functions** for dynamic styling
- **Full control** over styling (no utility-class bloat)
- **Lean bundle size** compared to large CSS frameworks

Combined with Angular Material for common UI patterns, this approach balances power with maintainability.

#### **5\. Docker-First Development**

Benefits for teams:

- **Consistent environments** across all developers
- **No "works on my machine"** issues
- **Faster onboarding** (minutes vs hours)
- **Production parity** (dev matches production)
- **Easy CI/CD integration**

---

## 🚀 Deployment

### Deploy with Docker

This setup is deployment-ready for:

| Platform             | Free Tier                 | Docker Support | Setup Time |
| -------------------- | ------------------------- | -------------- | ---------- |
| **Render**           | ✅ Yes (with cold starts) | ✅ Yes         | 5 min      |
| **Railway**          | ✅ $5 credit/month        | ✅ Yes         | 5 min      |
| **Fly.io**           | ✅ Generous               | ✅ Yes         | 10 min     |
| **Google Cloud Run** | ✅ 2M requests/month      | ✅ Yes         | 15 min     |

**Quick Deployment to Render:**

1.  Connect your GitHub repository
2.  Select "Docker" as environment
3.  Deploy! (Uses Dockerfile automatically)

### Deploy to Static Hosts (Vercel, Netlify, GitHub Pages)

For static deployments without Docker:

```bash
# Build for production
npm run build

# Or with Docker
docker-compose run angular-dev ng build --configuration production

# Deploy the dist/ folder to your hosting provider

```

**Platforms:**

- **Vercel**: Connect GitHub repo → Auto-deploy
- **Netlify**: Connect GitHub repo → Auto-deploy
- **GitHub Pages**: Use `angular-cli-ghpages` package

---

## 🤝 Team Onboarding

### For New Team Members

**Zero local setup required with Docker!**

#### Step 1: Install Docker Desktop

- Windows/Mac: [Download Docker Desktop](https://www.docker.com/products/docker-desktop)
- Linux: Follow [Linux installation guide](https://docs.docker.com/engine/install/)

#### Step 2: Clone the Project

```bash
git clone https://github.com/victorbruce/angular-starter-project
cd angular-starter-project

```

#### Step 3: Start Development

```bash
docker-compose up

```

#### Step 4: Start Coding!

- Open http://localhost:4200
- Make changes to your code
- See changes auto-reload ✨

**No Node.js or Angular CLI installation needed!** 🎉

### Time to Productivity

| Setup Type      | Time Required                                               |
| --------------- | ----------------------------------------------------------- |
| **Traditional** | ~2 hours (install Node, CLI, dependencies, troubleshooting) |
| **With Docker** | ~5 minutes (install Docker, clone, run)                     |

**You save ~2 hours per developer!** ⚡

---

## 🔧 Troubleshooting

### Port Already in Use

```bash
# Change port in docker-compose.yml
ports:
  - "3000:4200"  # Use port 3000 instead

```

### Changes Not Reflecting

```
# Restart container
docker-compose restart angular-dev

# Or rebuild
docker-compose up --build angular-dev

```

### Permission Errors (Linux)

```bash
# Make scripts executable
chmod +x setup.sh

# Docker permission issues
sudo usermod -aG docker $USER
# Log out and back in

```

### Container Won't Start

```bash
# Check logs
docker-compose logs angular-dev

# Clean rebuild
docker-compose down -v
docker-compose build --no-cache
docker-compose up

```

---

## 📚 What's Included

### Project Structure

```bash
angular-starter-project/
├── src/
│   ├── app/
│   │   ├── core/              # Singleton services
│   │   ├── shared/            # Reusable components
│   │   ├── features/          # Feature modules
│   │   ├── store/             # NgRx state
│   │   ├── app.component.ts   # Root component
│   │   ├── app.config.ts      # App configuration
│   │   └── app.routes.ts      # Routing
│   ├── assets/                # Static files
│   └── environments/          # Environment configs
├── Dockerfile                 # Multi-stage build
├── docker-compose.yml         # Docker orchestration
├── .dockerignore              # Docker optimization
├── angular.json               # Angular config
├── jest.config.js             # Jest configuration
├── .eslintrc.json             # ESLint rules
├── .prettierrc                # Prettier config
├── .husky/                    # Git hooks
└── README.md                  # This file

```

---

## 📄 License

MIT License - feel free to use this for personal or commercial projects!

---

## 👤 Author

**Victor Bruce**

- GitHub: [@victorbruce](https://github.com/victorbruce)
- Project: [Angular Starter Project](https://github.com/victorbruce/angular-starter-project)

---

## 🌟 Contributing

For intstructions on contributing, [click here](./CONTRIBUTING.md)
