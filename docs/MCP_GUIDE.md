# MCP Guide

## Default set bundled in this plugin

### Context7
Use for current framework and library docs.

### Playwright
Use for browser exploration, UI validation, interaction flows, and E2E-oriented debugging.

### Supabase
Use for database and platform tasks when the project uses Supabase.

### Figma
Use for design-informed implementation and component alignment with real design context.

### Sentry
Use for real production/debugging context, issue triage, and tracing-driven fixes.

### Linear
Use for product operations, issue creation, task lookup, and planning workflows.

## Optional presets

See `mcp-presets/` for extra stacks:
- GitHub local
- GitHub remote
- design-heavy
- observability-heavy
- startup lean
- Supabase fullstack

## Selection strategy

Use the smallest useful combination.

Examples:
- Landing page from a Figma file → Figma + Playwright + Context7
- SaaS with Supabase → Supabase + Context7 + Playwright + optional Sentry
- Product development with issue tracking → Linear + GitHub + Playwright
- Production bug hunt → Sentry + GitHub + Playwright
