#!/usr/bin/env bash
set -euo pipefail

echo "== Loading Studio Autopilot: runtime doctor =="
for cmd in node npm npx; do
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "[ok] $cmd -> $(command -v "$cmd")"
  else
    echo "[missing] $cmd"
  fi
done

if command -v docker >/dev/null 2>&1; then
  echo "[ok] docker -> $(command -v docker)"
else
  echo "[missing] docker"
fi

echo
echo "Tip:"
echo "- Playwright MCP and Context7 MCP need Node/npx."
echo "- GitHub local MCP preset needs Docker."
