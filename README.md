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

To build and run this project using Docker, follow these steps:

1. Ensure Docker and Docker Compose are installed on your system.
2. Build and start the service using Docker Compose:

   ```bash
   docker-compose up --build
   ```

3. The application will be accessible at `http://localhost:4032`.

### Notes

- The application uses Bun version 1.2.2 as specified in the Dockerfile.
- The service exposes port `4032` for external access.
- If an `.env` file is required, uncomment the `env_file` line in the `docker-compose.yml` file and provide the necessary environment variables.