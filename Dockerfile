# syntax=docker/dockerfile:1

# Define the Bun version to use
ARG BUN_VERSION=1.2.2

# Base image with Bun runtime
FROM oven/bun:${BUN_VERSION}-alpine AS base

# Set working directory
WORKDIR /app

# Install dependencies in a builder stage
FROM base AS builder

# Set cache directory for Bun
ENV BUN_INSTALL_CACHE=/root/.bun/install/cache

# Copy package files and lock file
COPY --link package.json bun.lock ./

# Install dependencies
RUN --mount=type=cache,target=${BUN_INSTALL_CACHE}     bun install --frozen-lockfile

# Copy the rest of the application files
COPY --link . .

# Final stage for production
FROM base AS final

# Set a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Copy necessary files from the builder stage
COPY --from=builder /app /app

# Expose the application port
EXPOSE 4032

# Command to run the application
CMD ["bun", "run", "index.ts"]