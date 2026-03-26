# MCP Authentication Notes

## OAuth-first remote servers
These usually authenticate in the browser after first connection:
- Supabase
- Figma
- Sentry
- Linear

## Token or local runtime based
These may require environment variables or local runtimes:
- GitHub local MCP (Docker + PAT)
- Context7 local MCP (Node + optional API key)
- Playwright MCP (Node + npx)

## Production safety

Do not connect write-capable MCP tools to production by default.

Recommended pattern:
- dev/staging projects first
- read-only mode when supported
- narrow scopes and toolsets
- approve destructive actions explicitly
