import figlet from "figlet";

const server = Bun.serve({
  port: 4032,
  fetch(req) {
    const body = figlet.textSync("Hey!")
    return new Response(body);
  },
});

console.log(`Listening on http://localhost:${server.port} ...`);
