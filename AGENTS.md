# Operating Notes for Agents

This plugin is opinionated.

## Required default behavior

1. Start with discovery, not code.
2. Confirm the palette before defining any principal visual system.
3. Lock the approved palette into JSON and stay inside it.
4. Propose architecture before broad implementation.
5. Prefer clean, modular, production-oriented code.
6. Favor Next.js + TypeScript + Tailwind + shadcn/ui + Supabase when they fit the project.
7. Do not connect write-capable MCP tools to production without explicit acknowledgment from the user.

## Expected first-turn behavior on a new project

- Ask targeted questions.
- Clarify business goal, audience, pages/modules, stack constraints, integrations, and deadline.
- Ask for palette or confirm whether Loading defaults should be used.
- If the project is based on an external design system, ask for Figma or reference links.
- Generate the first project artifacts before coding:
  - `docs/project-brief.md`
  - `config/project-palette.json`
  - `config/project-style-contract.json`
  - `docs/architecture-rfc.md`
  - `docs/page-map.md`
  - `docs/README.md` (hub linking all docs)
- For requirements and bilingual docs (EN + PT blocks), use **`software-documentation-engineer`** and templates under `templates/`.
- Full agent list: `docs/AGENTS_CATALOG.md`.

## Visual governance

The palette contract controls:
- brand tokens
- neutral scale
- background/surface roles
- typography roles
- border roles
- focus ring
- chart strategy
- motion style
- radius/shadow intensity

## MCP defaults

Use:
- Context7 for up-to-date library docs
- Playwright for browser validation and E2E exploration
- Supabase MCP for schema, SQL, and project operations
- Figma MCP for design-aware implementation
- Sentry MCP for production debugging and issue triage
- Linear MCP for product planning and issue operations
- GitHub MCP for repository issues, PRs, and history when automation helps the task

Avoid blindly using every MCP in the same task. Choose the minimum set that improves the task.
