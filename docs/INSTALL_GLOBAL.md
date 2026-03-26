# Global Installation

## Goal

Install once so new projects automatically inherit this system.

## Install as a user-level plugin

1. Push this repository to GitHub.
2. Open Cursor dashboard settings for plugins.
3. Import the GitHub repository.
4. Install **Loading Studio Autopilot** at **user level**.
5. Restart Cursor if needed.
6. Open Tools & MCP and authenticate the remote servers you want.

## Why user-level

A user-level plugin is the cleanest way to ship **rules, skills, agents, commands, and packaged MCP config** once, instead of duplicating `.cursor/` folders inside every application repository. The Cursor plugin format uses top-level `rules/`, `skills/`, `agents/`, and `commands/` in the plugin repo (see [Plugins reference](https://cursor.com/docs/reference/plugins)).

## Validate before relying on the install

From the plugin repository root:

```bash
bash scripts/validate-plugin.sh
```

## After installation

In any new project, prompt Cursor with one of these:

- `Use the project-bootstrap skill`
- `Act as the project-discovery-strategist and bootstrap this project`
- `Ask me the discovery questions and then create the palette and architecture files`

## Optional follow-up

If you want even tighter behavior, copy the short text from `docs/USER_RULES_SNIPPET.md` into Cursor **Settings → Rules**.
