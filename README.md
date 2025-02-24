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

- The application is built using Bun v1.2.2 and runs on port 4032.
- Ensure the `app-network` network is properly configured if using custom Docker networking.
- Uncomment the `env_file` line in the `docker-compose.yml` file and provide a `.env` file if environment variables are required.