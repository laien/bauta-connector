# Bauta connector

Connect your AI client to **[Bauta](https://bauta.app)** — a remote MCP server
that deploys HTML/React artifacts from your AI client to hosted, share-gated
URLs.

Bauta runs as a hosted **remote** MCP server. There is nothing to install to
use it: point any MCP client at the endpoint below and sign in. This repo is a
connect reference and a small stdio bridge for clients that only speak stdio.

## Endpoint

```
https://bauta.app/mcp
```

- Transport: Streamable HTTP
- Auth: OAuth 2.1 — supports both Dynamic Client Registration (DCR) and
  Client ID Metadata Documents (CIMD)
- Docs: https://bauta.app/docs

## What Bauta does

- Deploy HTML or React/JSX artifacts to a hosted URL in seconds (JSX is
  compiled at publish time).
- **Private by default** — a new deploy is unlisted (secret-link only); the
  bare URL is a 404 until you choose to share it.
- Sharing modes: public, unlisted, password, email verification, or fully
  private — changed at any time with the `set_sharing` tool.
- Updates and rollbacks keep the **same URL**.
- Artifacts run in a sandboxed iframe on a separate origin (no cookies, no
  cross-artifact access).
- EU data residency (content and metadata in EU-jurisdiction storage).
- Free tier, no credit card.

## Connect

### Clients that support remote MCP servers (recommended)

Add the endpoint as a custom connector and complete the OAuth sign-in:

```
https://bauta.app/mcp
```

### Clients that speak stdio only

Use the [`mcp-remote`](https://www.npmjs.com/package/mcp-remote) bridge:

```json
{
  "mcpServers": {
    "bauta": {
      "command": "npx",
      "args": ["-y", "mcp-remote", "https://bauta.app/mcp"]
    }
  }
}
```

The bridge opens a browser once to complete OAuth, then proxies stdio to the
hosted server.

## Docker

A Dockerfile is included that runs the stdio bridge:

```bash
docker build -t bauta-connector .
docker run -it bauta-connector
```

## Tools

Bauta exposes read and write tools kept strictly separate (deploy, update,
rollback, rename, set sharing, share via email, bind data source, analytics,
export, delete, and more). See https://bauta.app/docs for the full list.

## License

MIT — see [LICENSE](LICENSE).
