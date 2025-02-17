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

To build and run this project using Docker:

1. Ensure you have Docker and Docker Compose installed.

2. Build and start the service using Docker Compose:

   ```bash
   docker-compose up --build
   ```

3. The application will be available on port `4032`.

### Project-specific details

- **Bun Version**: The project uses Bun v1.2.2, as specified in the Dockerfile.
- **Exposed Port**: The application runs on port `4032` (mapped to the same port on the host).
- **Networks**: The service is connected to the `test-server-network` Docker network.
- **Dependencies**: Dependencies are installed using Bun with a frozen lockfile for consistency.

No additional environment variables or special configurations are required for this project.