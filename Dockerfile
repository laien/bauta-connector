# Stdio bridge to the hosted Bauta remote MCP server.
# Starts mcp-remote, which proxies a local stdio MCP connection to
# https://bauta.app/mcp (Streamable HTTP, OAuth 2.1).
FROM node:22-slim

ENV BAUTA_MCP_URL=https://bauta.app/mcp

# mcp-remote is fetched at runtime via npx; no build step needed.
ENTRYPOINT ["npx", "-y", "mcp-remote"]
CMD ["https://bauta.app/mcp"]
