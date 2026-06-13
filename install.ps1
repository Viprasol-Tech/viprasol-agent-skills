# Install the Viprasol Agent Skills into your agent's skills directory (Windows / PowerShell).
#   irm https://raw.githubusercontent.com/Viprasol-Tech/viprasol-agent-skills/main/install.ps1 | iex
# Options:
#   -Codex        install into ~/.codex/skills
#   -Dir <path>   install into a custom skills directory
[CmdletBinding()]
param(
    [switch]$Codex,
    [string]$Dir
)

$ErrorActionPreference = "Stop"

if ($Dir) {
    $dest = $Dir
} elseif ($Codex) {
    $dest = Join-Path $HOME ".codex/skills"
} else {
    $dest = Join-Path $HOME ".claude/skills"
}

$org = "https://github.com/Viprasol-Tech"
# repo_name = install_dir_name
$skills = [ordered]@{
    "smart-contract-audit"         = "smart-contract-audit"
    "tokenomics-review"            = "tokenomics-review"
    "defi-protocol-review"         = "defi-protocol-review"
    "wallet-security-review"       = "wallet-security-review"
    "onchain-forensics"            = "onchain-forensics"
    "trading-strategy-review"      = "trading-strategy-review"
    "options-strategy-analyzer"    = "options-strategy-analyzer"
    "risk-management-review"       = "risk-management-review"
    "financial-statement-analysis" = "financial-statement-analysis"
    "earnings-call-analyzer"       = "earnings-call-analyzer"
    "invoice-extractor"            = "invoice-extractor"
    "code-review-skill"            = "code-review"
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "git is required but was not found on PATH."
}

New-Item -ItemType Directory -Force -Path $dest | Out-Null
Write-Host "Installing Viprasol Agent Skills into: $dest"

foreach ($repo in $skills.Keys) {
    $dir = $skills[$repo]
    $target = Join-Path $dest $dir
    if (Test-Path (Join-Path $target ".git")) {
        Write-Host "  - $dir (updating)"
        git -C $target pull --quiet --ff-only
    } else {
        Write-Host "  - $dir"
        if (Test-Path $target) { Remove-Item -Recurse -Force $target }
        git clone --quiet --depth 1 "$org/$repo" $target
    }
}

Write-Host "Done. $($skills.Count) skills installed. Reload skills in your agent."
