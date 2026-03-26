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

A user-level plugin is the cleanest way to avoid copying `.cursor/` folders into every new repository.

## After installation

In any new project, prompt Cursor with one of these:

- `Use the project-bootstrap skill`
- `Act as the project-discovery-strategist and bootstrap this project`
- `Ask me the discovery questions and then create the palette and architecture files`

## Optional follow-up

If you want even tighter behavior, copy the short text from `docs/USER_RULES_SNIPPET.md` into Cursor **Settings → Rules**.
