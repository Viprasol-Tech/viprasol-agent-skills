#!/usr/bin/env bash
# Install the Viprasol Agent Skills into your agent's skills directory.
#   curl -fsSL https://raw.githubusercontent.com/Viprasol-Tech/viprasol-agent-skills/main/install.sh | bash
# Options:
#   --codex          install into ~/.codex/skills
#   --dir <path>     install into a custom skills directory
set -euo pipefail

DEST="${HOME}/.claude/skills"
while [ $# -gt 0 ]; do
  case "$1" in
    --codex) DEST="${HOME}/.codex/skills" ;;
    --dir) DEST="${2:?--dir needs a path}"; shift ;;
    -h|--help) grep '^#' "$0" | cut -c3-; exit 0 ;;
    *) echo "unknown option: $1" >&2; exit 1 ;;
  esac
  shift
done

ORG="https://github.com/Viprasol-Tech"
# repo_name:install_dir_name
SKILLS=(
  "smart-contract-audit:smart-contract-audit"
  "tokenomics-review:tokenomics-review"
  "defi-protocol-review:defi-protocol-review"
  "wallet-security-review:wallet-security-review"
  "onchain-forensics:onchain-forensics"
  "trading-strategy-review:trading-strategy-review"
  "financial-statement-analysis:financial-statement-analysis"
  "earnings-call-analyzer:earnings-call-analyzer"
  "invoice-extractor:invoice-extractor"
  "code-review-skill:code-review"
)

command -v git >/dev/null 2>&1 || { echo "git is required but not found." >&2; exit 1; }
mkdir -p "$DEST"
echo "Installing Viprasol Agent Skills into: $DEST"

for entry in "${SKILLS[@]}"; do
  repo="${entry%%:*}"
  dir="${entry##*:}"
  target="$DEST/$dir"
  if [ -d "$target/.git" ]; then
    echo "  - $dir (updating)"
    git -C "$target" pull --quiet --ff-only || echo "    (skipped update)"
  else
    echo "  - $dir"
    rm -rf "$target"
    git clone --quiet --depth 1 "$ORG/$repo" "$target"
  fi
done

echo "Done. ${#SKILLS[@]} skills installed. Reload skills in your agent and try:"
echo '  "Audit this staking contract for vulnerabilities"'
