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

To build and run this project using Docker, ensure you have Docker and Docker Compose installed. This project uses Bun v1.2.2 and exposes port 4032.

### Build and Run Instructions

1. Build and start the service using Docker Compose:

   ```bash
   docker-compose up --build
   ```

2. The application will be accessible on `http://localhost:4032`.

### Project-Specific Details

- **Bun Version**: The project uses Bun v1.2.2, as specified in the Dockerfile.
- **Exposed Port**: The application runs on port `4032` (mapped to the same port on the host).
- **Networks**: The service is part of the `test-network` Docker network.

No additional environment variables or special configurations are required for this project.