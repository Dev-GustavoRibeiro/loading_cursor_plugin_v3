# Safety and Security Baseline

- Prefer least privilege on every integration.
- Use read-only or scoped modes where possible.
- Keep secrets in environment variables, not committed files.
- Do not let agents push destructive schema or auth changes to production without explicit approval.
- Use Supabase MCP against development environments first.
- Use GitHub MCP with fine-grained tokens and restricted toolsets.
- Treat MCP as powerful infrastructure, not just convenience tooling.
