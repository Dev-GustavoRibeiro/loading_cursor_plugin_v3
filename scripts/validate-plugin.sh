#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

errs=0
err() { echo "ERROR: $1" >&2; errs=$((errs + 1)); }

[[ -f .cursor-plugin/plugin.json ]] || err "Missing .cursor-plugin/plugin.json"
[[ -f .mcp.json ]] || err "Missing .mcp.json"

if command -v jq >/dev/null 2>&1; then
  jq -e '.name | type == "string" and length > 0' .cursor-plugin/plugin.json >/dev/null || err "plugin.json: missing or invalid name"
  jq -e '.name | test("^[a-z0-9][a-z0-9.-]*[a-z0-9]$")' .cursor-plugin/plugin.json >/dev/null || err "plugin.json: name must be kebab-case (lowercase, start/end alphanumeric)"
  jq -e '.mcpServers | type == "object"' .mcp.json >/dev/null || err ".mcp.json: mcpServers must be an object"
else
  echo "WARN: jq not found; skipping strict JSON checks (install jq for full validation)."
fi

shopt -s nullglob
rules=(rules/*.mdc rules/*.md rules/*.markdown)
if [[ ${#rules[@]} -eq 0 ]]; then
  err "No rule files under rules/"
else
  for f in "${rules[@]}"; do
    head -n 1 "$f" | grep -q '^---$' || err "Rule missing YAML frontmatter start (---): $f"
  done
fi

skills=(skills/*/SKILL.md)
if [[ ${#skills[@]} -eq 0 ]]; then
  err "No skills/*/SKILL.md found"
else
  for f in "${skills[@]}"; do
    head -n 1 "$f" | grep -q '^---$' || err "Skill missing YAML frontmatter start (---): $f"
  done
fi

agents=(agents/*.md agents/*.mdc agents/*.markdown)
if [[ ${#agents[@]} -eq 0 ]]; then
  err "No agent files under agents/"
else
  for f in "${agents[@]}"; do
    head -n 1 "$f" | grep -q '^---$' || err "Agent missing YAML frontmatter start (---): $f"
  done
fi

cmds=(commands/*.md commands/*.mdc commands/*.markdown commands/*.txt)
if [[ ${#cmds[@]} -eq 0 ]]; then
  err "No command files under commands/"
else
  for f in "${cmds[@]}"; do
    head -n 1 "$f" | grep -q '^---$' || err "Command missing YAML frontmatter start (---): $f"
  done
fi

if [[ -f .cursor-plugin/marketplace.json ]] && command -v jq >/dev/null 2>&1; then
  jq -e '.name and .owner.name and (.plugins | type == "array") and (.plugins | length > 0)' .cursor-plugin/marketplace.json >/dev/null || err "marketplace.json: requires name, owner.name, and non-empty plugins[]"
  jq -e '.plugins[] | has("name") and has("source")' .cursor-plugin/marketplace.json >/dev/null || err "marketplace.json: each plugin needs name and source"
fi

if [[ $errs -gt 0 ]]; then
  echo "Validation failed with $errs error(s)." >&2
  exit 1
fi

echo "OK: Plugin bundle structure checks passed."
