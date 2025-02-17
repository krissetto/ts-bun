# test-server

To install dependencies:

```bash
bun install
```

To run:

```bash
bun run index.ts
```

This project was created using `bun init` in bun v1.2.2. [Bun](https://bun.sh) is a fast all-in-one JavaScript runtime.

## Running with Docker

To run this project using Docker, follow these steps:

### Requirements
- Docker and Docker Compose must be installed on your system.
- This project uses Bun v1.2.2, as specified in the Dockerfile.

### Build and Run Instructions
1. Build and start the Docker container using Docker Compose:

   ```bash
   docker-compose up --build
   ```

2. The application will be accessible at `http://localhost:4032`.

### Configuration
- No additional environment variables are required for this project.
- The application runs as a non-root user for enhanced security.

### Ports
- The application exposes port `4032` as defined in the Docker Compose file.