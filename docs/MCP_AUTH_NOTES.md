# MCP Authentication Notes

## OAuth-first remote servers
These usually authenticate in the browser after first connection:
- Supabase
- Figma
- Sentry
- Linear

## Token or local runtime based
These may require environment variables or local runtimes:
- **GitHub (plugin default):** stdio via `@modelcontextprotocol/server-github` — set `GITHUB_PERSONAL_ACCESS_TOKEN` (see `.env.example`).
- GitHub alternative: `mcp-presets/github-remote.json` (Copilot MCP URL + bearer headers).
- GitHub local MCP (Docker + PAT) — see `mcp-presets/github-local.json`
- Context7 (Node + npx): optional `CONTEXT7_API_KEY` for higher limits
- Playwright MCP (Node + npx)

## Production safety

Do not connect write-capable MCP tools to production by default.

Recommended pattern:
- dev/staging projects first
- read-only mode when supported
- narrow scopes and toolsets
- approve destructive actions explicitly
