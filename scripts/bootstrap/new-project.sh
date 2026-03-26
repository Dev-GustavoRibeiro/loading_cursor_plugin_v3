#!/usr/bin/env bash
set -euo pipefail

mkdir -p config docs

if [ ! -f config/project-palette.json ]; then
  cp config/loading-default-palette.json config/project-palette.json
  echo "[created] config/project-palette.json"
else
  echo "[skip] config/project-palette.json already exists"
fi

for src in templates/project-brief.md templates/page-map.md templates/architecture-rfc.md; do
  base="$(basename "$src")"
  out="docs/$base"
  if [ ! -f "$out" ]; then
    cp "$src" "$out"
    echo "[created] $out"
  else
    echo "[skip] $out already exists"
  fi
done

echo
echo "Bootstrap finished."
echo "Next: ask the agent to refine these files with discovery answers."
