New-Item -ItemType Directory -Force -Path config, docs | Out-Null

if (-not (Test-Path "config/project-palette.json")) {
  Copy-Item "config/loading-default-palette.json" "config/project-palette.json"
  Write-Host "[created] config/project-palette.json"
} else {
  Write-Host "[skip] config/project-palette.json already exists"
}

foreach ($src in @("templates/project-brief.md","templates/page-map.md","templates/architecture-rfc.md")) {
  $base = Split-Path $src -Leaf
  $out = Join-Path "docs" $base
  if (-not (Test-Path $out)) {
    Copy-Item $src $out
    Write-Host "[created] $out"
  } else {
    Write-Host "[skip] $out already exists"
  }
}

$hub = "templates/documentation-hub.md"
$readme = Join-Path "docs" "README.md"
if ((Test-Path $hub) -and -not (Test-Path $readme)) {
  Copy-Item $hub $readme
  Write-Host "[created] docs/README.md (from documentation-hub template)"
} elseif (Test-Path $readme) {
  Write-Host "[skip] docs/README.md already exists"
}

Write-Host ""
Write-Host "Bootstrap finished."
Write-Host "Next: ask the agent to refine these files with discovery answers."
Write-Host "Optional: act as software-documentation-engineer for FR/NFR and mind maps."
