# Angular Starter Project

A comprehensive starter project for Angular applications. This kit is Dockerized and comes pre-configured with a suite of tools commonly used in enterprise-level applications, including state management, UI component libraries, and more.

Live URL: [link](some url)

## 📌 Table of Contents

- [🚀 Getting Started](#-getting-started)
- [🛠️ Tech Stack](#-tech-stack)
- [📦 Installing](#-installing)
- [💻 Running the Application](#-running-the-application)
- [📋 Approach](#-approach)
- [🚀 Deployment](#-deployment)
- [👤 Author](#-author)

## 🚀 Getting Started

**Prerequisites**

Before you begin, ensure you have the following tools installed on your development machine:

- **Node.js**: It is recommended to use an actively supported LTS version. This project supports `^20.19.0`, `^22.12.0`, or `^24.0.0`.

- **Angular CLI**: Version 20 or higher (`npm install -g @angular/cli`).

- **npm**: Comes bundled with Node.js.

- **Docker Desktop**: Required for running the application in a containerized environment.

## 🛠️ Tech Stack

This project is built with a modern, scalable, and maintainable tech stack:

- **Framework**: Angular

- **Language**: JavaScript/TypeScript

- **Styling**: SCSS & Angular Material

- **State Management**: NgRx (Store, Effects, Entities)

- **Testing**: Jest (Unit & Integration Testing)

- **Linting & Formatting**: ESLint & Prettier

- **Git Hooks**: Husky (for pre-commit checks)

- **Containerization**: Docker

## 📦 Installing

1. Clone the repository:

```bash
git clone https://github.com/victorbruce/angular-starter-project
```

2. Navigate to the project directory:

```bash
Navigate to the project directory:
```

3. Install the required dependencies:

```bash
npm install
```

## 💻 Running the Application

### **Development Server**

Run `ng serve` for a local development server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

```bash
ng serve
```

### **Containerized Environment (Docker)**

> **Note:** Docker configuration is planned for this starter. The commands below are placeholders for the intended setup.

To build and run the application using Docker (once configured):

```bash
# Build the Docker image
docker-compose build

# Start the services in detached mode
docker-compose up -d
```

### **Running Tests:**

This project uses Jest for unit testing. To execute the tests, run:

```bash
npm test
```

### **Linting and Formatting**

This starter is configured with ESLint and Prettier to ensure code consistency.

- **To run the linter and automatically fix issues:**

```bash
npm run lint:fix
```

- **To format the entire codebase:**

```bash
npm run format
```

## 📋 Approach

This starter project is built with a few key principles in mind to ensure scalability, maintainability, and code quality.

- **Robust State Management (NgRx)**: NgRx was chosen for its robust, Redux-inspired pattern. It establishes a single source of truth for application state, which is crucial for scalability and debugging complex applications (especially when compared to service-based state management). Its widespread adoption and large community also ensure excellent documentation and long-term support.

- **Automated Code Quality**: The project comes pre-configured with Husky, ESLint, and Prettier. These tools automatically lint, format, and run pre-commit checks to enforce a consistent coding standard and prevent unclean code from ever being committed.

- **Scalable Project Structure:** The folder organization is designed to be intuitive and scalable, making it easy for developers to locate files and understand where to place new features, components, and services.

- **Lean Styling (SCSS):** SCSS is used for its powerful features (variables, mixins, nesting). This approach avoids reliance on large, third-party utility-first CSS libraries, giving you full styling control while helping to maintain a lean application bundle size.

## 🚀 Deployment

N/A

## 👤 Author

- **Victor Bruce**
