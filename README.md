# Loading Studio Autopilot — Cursor Plugin

A user-level Cursor plugin that makes new projects start with the same delivery system every time:

- discovery before implementation
- palette governance with locked JSON contracts
- Loading defaults when appropriate
- specialized agents and skills
- reusable project bootstrap templates
- prewired MCP configuration for modern product workflows

## What becomes automatic

After you import this repository as a **user-level plugin** in Cursor, every new project can inherit:

- global rules and behavioral standards
- your specialist agents
- your reusable skills
- MCP server definitions from `.mcp.json`
- project bootstrap templates and scripts

## What still needs authentication

Some MCP servers are remote services and still require vendor auth the first time you connect:

- Supabase
- Figma
- Sentry
- Linear

## Recommended install flow

1. Push this repository to GitHub.
2. In Cursor, open **Dashboard → Settings → Plugins → Import**.
3. Paste the GitHub repository URL.
4. Install it at **user level**.
5. Open **Cursor Settings → Tools & MCP** and authenticate the remote servers you want.
6. In any new repository, start with:
   - `Use the project-bootstrap skill`
   - or `Act as the project-discovery-strategist and bootstrap this project`

## Included MCP strategy

### Active-by-default in `.mcp.json`
- Playwright MCP
- Context7 MCP
- Supabase MCP
- Figma MCP
- Sentry MCP
- Linear MCP

### Optional presets
See `mcp-presets/` for:
- GitHub local (Docker)
- GitHub remote
- full observability stack
- design-heavy stack
- lean startup stack
- Supabase-heavy fullstack stack

## Important governance rules

- The agent must ask for or confirm the brand palette before defining the visual system.
- Main project colors must stay inside `config/project-palette.json`.
- Semantic utility colors can exist for success, error, warning, and info.
- The agent must not invent a new brand palette without approval.
- Discovery and architecture always come before implementation.

## Main folders

- `.cursor/rules/` → persistent behavior rules
- `.cursor/agents/` → specialist agents
- `.cursor/skills/` → reusable workflows
- `config/` → palette and style contracts
- `templates/` → briefs and architecture docs
- `docs/` → operating model and installation docs
- `mcp-presets/` → optional MCP packs
- `scripts/` → local bootstrap and diagnostics helpers
