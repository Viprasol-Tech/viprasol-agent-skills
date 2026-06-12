#!/usr/bin/env python3
"""Bulletproof hub validator (pure stdlib): every advertised skill must be wired
into the README and both installers, and install.sh must be syntactically sane.

Exits 0 on success, 1 on any inconsistency. No third-party deps.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

REPOS = [
    "smart-contract-audit",
    "tokenomics-review",
    "defi-protocol-review",
    "trading-strategy-review",
    "financial-statement-analysis",
    "earnings-call-analyzer",
    "invoice-extractor",
    "code-review-skill",
]


def main() -> int:
    errors: list[str] = []

    readme = (ROOT / "README.md").read_text(encoding="utf-8")
    sh = (ROOT / "install.sh").read_text(encoding="utf-8")
    ps1 = (ROOT / "install.ps1").read_text(encoding="utf-8")

    for repo in REPOS:
        if f"Viprasol-Tech/{repo}" not in readme:
            errors.append(f"README missing link to {repo}")
        if repo not in sh:
            errors.append(f"install.sh missing {repo}")
        if repo not in ps1:
            errors.append(f"install.ps1 missing {repo}")

    # shebang sanity for install.sh (full syntax is checked by `bash -n` in CI)
    if not sh.startswith("#!/usr/bin/env bash"):
        errors.append("install.sh missing bash shebang")

    # the README's skill-count badge should match
    m = re.search(r"skills-(\d+)-green", readme)
    if m and int(m.group(1)) != len(REPOS):
        errors.append(f"README skill-count badge says {m.group(1)}, expected {len(REPOS)}")

    if errors:
        print("HUB VALIDATION FAILED:")
        for e in errors:
            print(f"  - {e}")
        return 1

    print(f"OK: {len(REPOS)} skills wired into README + install.sh + install.ps1.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
