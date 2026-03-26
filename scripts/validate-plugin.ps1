$ErrorActionPreference = "Stop"
$Root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
Set-Location $Root

$script:errCount = 0
function Add-Err([string]$Message) {
    Write-Host "ERROR: $Message" -ForegroundColor Red
    $script:errCount++
}

if (-not (Test-Path ".cursor-plugin/plugin.json")) { Add-Err "Missing .cursor-plugin/plugin.json" }
if (-not (Test-Path ".mcp.json")) { Add-Err "Missing .mcp.json" }

$jq = Get-Command jq -ErrorAction SilentlyContinue
if ($jq) {
    jq -e '.name | type == "string" and length > 0' .cursor-plugin/plugin.json | Out-Null
    if ($LASTEXITCODE -ne 0) { Add-Err "plugin.json: missing or invalid name" }
    jq -e '.name | test("^[a-z0-9][a-z0-9.-]*[a-z0-9]$")' .cursor-plugin/plugin.json | Out-Null
    if ($LASTEXITCODE -ne 0) { Add-Err "plugin.json: name must be kebab-case" }
    jq -e '.mcpServers | type == "object"' .mcp.json | Out-Null
    if ($LASTEXITCODE -ne 0) { Add-Err ".mcp.json: mcpServers must be an object" }
} else {
    Write-Warning "jq not found; install jq for strict JSON validation."
}

$ruleDir = Join-Path $Root "rules"
if (-not (Test-Path $ruleDir)) {
    Add-Err "Missing rules/ directory"
} else {
    $ruleFiles = @()
    $ruleFiles += Get-ChildItem -Path $ruleDir -Filter "*.mdc" -File -ErrorAction SilentlyContinue
    $ruleFiles += Get-ChildItem -Path $ruleDir -Filter "*.md" -File -ErrorAction SilentlyContinue
    $ruleFiles += Get-ChildItem -Path $ruleDir -Filter "*.markdown" -File -ErrorAction SilentlyContinue
    if ($ruleFiles.Count -eq 0) { Add-Err "No rule files under rules/" }
    foreach ($f in $ruleFiles) {
        $first = Get-Content -LiteralPath $f.FullName -TotalCount 1
        if ($first -ne "---") { Add-Err "Rule missing YAML frontmatter (---): $($f.Name)" }
    }
}

$skillsRoot = Join-Path $Root "skills"
if (-not (Test-Path $skillsRoot)) {
    Add-Err "Missing skills/ directory"
} else {
    $skillFiles = Get-ChildItem -Path $skillsRoot -Recurse -Filter SKILL.md -File
    if ($skillFiles.Count -eq 0) { Add-Err "No skills/*/SKILL.md found" }
    foreach ($f in $skillFiles) {
        $first = Get-Content -LiteralPath $f.FullName -TotalCount 1
        if ($first -ne "---") { Add-Err "Skill missing YAML frontmatter (---): $($f.FullName)" }
    }
}

$agentsDir = Join-Path $Root "agents"
if (-not (Test-Path $agentsDir)) {
    Add-Err "Missing agents/ directory"
} else {
    $agentFiles = @()
    $agentFiles += Get-ChildItem -Path $agentsDir -Filter "*.md" -File -ErrorAction SilentlyContinue
    $agentFiles += Get-ChildItem -Path $agentsDir -Filter "*.mdc" -File -ErrorAction SilentlyContinue
    $agentFiles += Get-ChildItem -Path $agentsDir -Filter "*.markdown" -File -ErrorAction SilentlyContinue
    if ($agentFiles.Count -eq 0) { Add-Err "No agent files under agents/" }
    foreach ($f in $agentFiles) {
        $first = Get-Content -LiteralPath $f.FullName -TotalCount 1
        if ($first -ne "---") { Add-Err "Agent missing YAML frontmatter (---): $($f.Name)" }
    }
}

$commandsDir = Join-Path $Root "commands"
if (-not (Test-Path $commandsDir)) {
    Add-Err "Missing commands/ directory"
} else {
    $cmdFiles = @()
    $cmdFiles += Get-ChildItem -Path $commandsDir -Filter "*.md" -File -ErrorAction SilentlyContinue
    $cmdFiles += Get-ChildItem -Path $commandsDir -Filter "*.mdc" -File -ErrorAction SilentlyContinue
    $cmdFiles += Get-ChildItem -Path $commandsDir -Filter "*.markdown" -File -ErrorAction SilentlyContinue
    $cmdFiles += Get-ChildItem -Path $commandsDir -Filter "*.txt" -File -ErrorAction SilentlyContinue
    if ($cmdFiles.Count -eq 0) { Add-Err "No command files under commands/" }
    foreach ($f in $cmdFiles) {
        $first = Get-Content -LiteralPath $f.FullName -TotalCount 1
        if ($first -ne "---") { Add-Err "Command missing YAML frontmatter (---): $($f.Name)" }
    }
}

$mp = Join-Path $Root ".cursor-plugin/marketplace.json"
if ((Test-Path $mp) -and $jq) {
    jq -e '.name and .owner.name and (.plugins | type == "array") and (.plugins | length > 0)' $mp | Out-Null
    if ($LASTEXITCODE -ne 0) { Add-Err "marketplace.json: requires name, owner.name, non-empty plugins[]" }
    jq -e '.plugins[] | has("name") and has("source")' $mp | Out-Null
    if ($LASTEXITCODE -ne 0) { Add-Err "marketplace.json: each plugin entry needs name and source" }
}

if ($script:errCount -gt 0) {
    Write-Host "Validation failed with $($script:errCount) error(s)." -ForegroundColor Red
    exit 1
}

Write-Host "OK: Plugin bundle structure checks passed." -ForegroundColor Green
