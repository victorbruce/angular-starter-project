# ==================================
# Stage 1: Base Node Image
# ==================================
FROM node:22-alpine AS base
LABEL maintainer="victorbruce82@gmail.com"

# Set working directory
WORKDIR /app

# Install Angular CLI globally (so developers don't need it locally)
RUN npm install -g @angular/cli@20

# ==================================
# Stage 2: Development Environment
# ==================================
FROM base AS development

# Copy package files
COPY package*.json ./

# Install all dependencies (including devDependencies)
RUN npm ci

# Copy all source code
COPY . .

# Expose Angular dev server port
EXPOSE 4200

ENV NG_CLI_ANALYTICS=false

# Start Angular dev server
# --host 0.0.0.0 allows access from outside container
# --poll ensures file watching works in Docker
CMD ["ng", "serve", "--host", "0.0.0.0", "--poll", "2000"]

# ==================================
# Stage 3: Build for Production
# ==================================
FROM base AS build

# Copy package files
COPY package*.json ./

# Install only production dependencies first (for layer caching)
RUN npm ci --omit=dev --ignore-scripts && \
    cp -R node_modules /tmp/node_modules

# Install all dependencies for build
RUN npm ci --ignore-scripts

# Copy source code
COPY . .

# Build Angular app for production
RUN ng build --configuration production


# ==================================
# Stage 4: Production with Nginx
# ==================================
FROM nginx:alpine AS production

# Copy custom nginx config (optional - use default if not provided)
# COPY nginx.conf /etc/nginx/nginx.conf

# Copy built Angular app from build stage
COPY --from=build /app/dist/angular-starter-project/browser /usr/share/nginx/html


# Copy production node_modules if needed for SSR (optional)
# COPY --from=build /tmp/node_modules ./node_modules

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
