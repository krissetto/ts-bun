# syntax=docker/dockerfile:1

# Set the Bun version to match the project
ARG BUN_VERSION=1.2.2

# Use the official Bun Alpine image as the base image
FROM oven/bun:${BUN_VERSION}-alpine AS base

# Set the working directory
WORKDIR /app

# Configure Bun cache directory
ENV BUN_INSTALL_CACHE=/root/.bun/install/cache

# Install dependencies in a builder stage
FROM base AS builder

# Copy only the necessary files for dependency installation
COPY --link package.json bun.lock ./

# Install dependencies (including devDependencies for building)
RUN --mount=type=cache,target=${BUN_INSTALL_CACHE} \
    bun install --frozen-lockfile

# Copy the rest of the application files
COPY --link . .

# Final stage for production
FROM base AS final

# Create a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Copy only the necessary files from the builder stage
COPY --from=builder /app /app

# Expose the port used by the application
EXPOSE 4032

# Command to run the application
CMD ["bun", "run", "index.ts"]