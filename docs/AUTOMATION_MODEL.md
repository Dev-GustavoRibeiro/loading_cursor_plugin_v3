# Automation Model

This plugin automates four layers:

## 1. Global behavior
Through plugin rules and agents.

## 2. Reusable workflows
Through skills like project bootstrap, palette governance, design handoff, Supabase-safe migrations, and E2E QA.

## 3. MCP registration
Through the root `.mcp.json`, which packages MCP server definitions with the plugin.

## 4. New-project initialization
Through the `project-bootstrap` skill and the scripts in `scripts/bootstrap/`.

## What is truly automatic

- plugin distribution
- skill availability
- agent availability
- MCP server definitions packaged with the plugin
- reusable templates

## What still cannot be bypassed safely

- vendor OAuth flows
- PAT entry for some services
- runtime dependencies like Node or Docker when a given MCP server requires them
- user approval for high-risk write operations
