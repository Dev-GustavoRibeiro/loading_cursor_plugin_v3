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

if [ -f templates/documentation-hub.md ] && [ ! -f docs/README.md ]; then
  cp templates/documentation-hub.md docs/README.md
  echo "[created] docs/README.md (from documentation-hub template)"
else
  if [ -f docs/README.md ]; then
    echo "[skip] docs/README.md already exists"
  fi
fi

echo
echo "Bootstrap finished."
echo "Next: ask the agent to refine these files with discovery answers."
echo "Optional: act as software-documentation-engineer for FR/NFR and mind maps."
