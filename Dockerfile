# syntax=docker/dockerfile:1
ARG BUN_VERSION=1.2.2
FROM oven/bun:${BUN_VERSION}-alpine AS base
WORKDIR /app

# Install dependencies in builder stage
FROM base AS builder
ENV BUN_INSTALL_CACHE=/root/.bun/install/cache
# Only copy lockfile and package.json for install step for better caching
COPY --link bun.lock ./bun.lock
COPY --link package.json ./package.json
RUN --mount=type=cache,target=${BUN_INSTALL_CACHE} \
    bun install --frozen-lockfile --production
# Copy the rest of the app source
COPY --link index.ts ./index.ts

# Final image
FROM base AS final
# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
WORKDIR /app
# Copy only what's needed from builder
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/index.ts ./index.ts

EXPOSE 4032
CMD ["bun", "run", "index.ts"]
