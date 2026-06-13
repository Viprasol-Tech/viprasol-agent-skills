<div align="center">

# Viprasol Agent Skills

**The fintech-focused Agent Skills collection — trading, crypto/DeFi, finance, and developer skills that drop into Claude Code, Codex, Cursor & 26+ AI tools.**

_Built and maintained by [Viprasol Tech](https://viprasol.com) — Fintech Experts. Full-Stack Builders._

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Agent Skills](https://img.shields.io/badge/Agent%20Skills-Compatible-blueviolet.svg)](https://agentskills.io)
[![Skills](https://img.shields.io/badge/skills-13-green.svg)](#-the-skills)
[![Works with](https://img.shields.io/badge/Claude%20Code%20·%20Codex%20·%20Cursor-26%2B%20tools-black.svg)](#-install)
[![Telegram](https://img.shields.io/badge/Telegram-help-26A5E4.svg)](https://t.me/viprasol_help)

</div>

---

Most Agent Skill collections are general-purpose. **This one is built for money** — the workflows fintech teams, quant traders, crypto researchers, and finance analysts actually run. Every skill is portable (a plain `skill.md`), works across [any Agent Skills–compatible tool](https://agentskills.io), is grounded in a real framework (SWC Registry, López de Prado's backtest-overfitting research, Altman Z / Beneish M, OWASP/CWE), and ships with worked examples.

> Each skill lives in its own repo so you can install just what you need. This hub is the index + one-command installer.

## 🧰 The skills

### ₿ Crypto & DeFi
| Skill | What it does |
|-------|--------------|
| [**smart-contract-audit**](https://github.com/Viprasol-Tech/smart-contract-audit) | Solidity/EVM security audit — 18 vulnerability classes (reentrancy, access control, oracle manipulation…), exploit scenarios + fixes. Grounded in the SWC Registry. |
| [**tokenomics-review**](https://github.com/Viprasol-Tech/tokenomics-review) | Token economics red-flag review — supply/FDV, insider vesting, unlock overhang, liquidity, rug vectors → risk scorecard. |
| [**defi-protocol-review**](https://github.com/Viprasol-Tech/defi-protocol-review) | DeFi protocol due-diligence — admin keys, audits, yield sustainability, TVL & oracle risk → risk matrix + verdict. |
| [**wallet-security-review**](https://github.com/Viprasol-Tech/wallet-security-review) | Before you sign — review a signature/approval request or audit a wallet for drainer & phishing risk (Permit2, setApprovalForAll, eth_sign, EIP-7702). |
| [**onchain-forensics**](https://github.com/Viprasol-Tech/onchain-forensics) | Trace funds across addresses & chains — MIH/change-address/FIFO mixer heuristics, bridge & DEX hop tracing, OFAC checks, Daubert-grade evidence notes. |

### 📈 Trading & markets
| Skill | What it does |
|-------|--------------|
| [**trading-strategy-review**](https://github.com/Viprasol-Tech/trading-strategy-review) | Vet a strategy/backtest for the failure modes that blow up live — look-ahead bias, overfitting, survivorship, slippage, risk-of-ruin. Grounded in PBO & Deflated Sharpe. |
| [**options-strategy-analyzer**](https://github.com/Viprasol-Tech/options-strategy-analyzer) | Vet an options trade — pick the right structure for your view, compute Max P/L, break-evens, Greeks, IV-rank context & PoP-vs-EV with a risk-management plan. |
| [**risk-management-review**](https://github.com/Viprasol-Tech/risk-management-review) | Risk-review a portfolio / strategy / position — σ, MDD, VaR/CVaR, Sharpe/Sortino/Calmar/UPI, Kelly & vol-target sizing, concentration & leverage caps, stress tests. |

### 💼 Finance & accounting
| Skill | What it does |
|-------|--------------|
| [**financial-statement-analysis**](https://github.com/Viprasol-Tech/financial-statement-analysis) | Fundamental analysis — liquidity/solvency/profitability ratios, DuPont, Altman Z, Beneish M, red flags, sector benchmarks. |
| [**earnings-call-analyzer**](https://github.com/Viprasol-Tech/earnings-call-analyzer) | Digest an earnings call — KPIs vs guidance, management tone & candor, Q&A red flags, watch-items. |
| [**invoice-extractor**](https://github.com/Viprasol-Tech/invoice-extractor) | Extract invoices & receipts into clean validated JSON — vendor, line items, totals, tax — with math reconciliation. |

### 🛠️ Developer
| Skill | What it does |
|-------|--------------|
| [**code-review-skill**](https://github.com/Viprasol-Tech/code-review-skill) | Rigorous, prioritized code review — correctness → security (OWASP/CWE) → performance → tests, with specific fixes, not nitpicks. |
| [**api-security-review**](https://github.com/Viprasol-Tech/api-security-review) | Review REST/GraphQL APIs against the OWASP API Top 10 2023 — BOLA, broken auth, mass assignment, SSRF, JWT/OAuth/CORS pitfalls — with curl PoCs and code-level fixes. |

## 🚀 Install

Agent Skills are just folders. Clone the ones you want into your tool's skills directory.

**One skill (Claude Code):**
```bash
git clone https://github.com/Viprasol-Tech/smart-contract-audit ~/.claude/skills/smart-contract-audit
```

**All of them, one command** (Claude Code — pass `--codex` to target `~/.codex/skills`, or `--dir <path>` for any tool):
```bash
curl -fsSL https://raw.githubusercontent.com/Viprasol-Tech/viprasol-agent-skills/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/Viprasol-Tech/viprasol-agent-skills/main/install.ps1 | iex
```

Then just ask your agent, e.g. `Audit this staking contract for vulnerabilities` or `Review my MA-crossover backtest for look-ahead bias`.

## ✅ Why these are different

- **Fintech-native** — built for trading, crypto, and finance work, not generic "write code" tasks.
- **Grounded** — each skill cites a real methodology (SWC Registry, PBO/Deflated Sharpe, Altman Z & Beneish M, OWASP/CWE) instead of vibes.
- **Portable** — plain `skill.md`; works in Claude Code, OpenAI Codex, Cursor, GitHub Copilot, Gemini CLI, and [26+ Agent Skills tools](https://agentskills.io).
- **Worked examples** — every skill ships with realistic sample outputs so you know exactly what you'll get.

> ⚠️ **Disclaimer:** These skills are decision-support tools for research and education. They are **not** financial, investment, legal, or security-audit advice, and are no substitute for a professional audit or a licensed advisor. Always verify against primary sources. Crypto and trading carry real risk of loss.

> ⭐ **If these help you, a star on the skills you use means a lot** — it tells us what to build next.

## Contact — Viprasol Tech Private Limited
- 🌐 Website: [viprasol.com](https://viprasol.com)
- ✉️ Email: [support@viprasol.com](mailto:support@viprasol.com)
- 💬 Telegram: [t.me/viprasol_help](https://t.me/viprasol_help) · 📱 WhatsApp: +91 96336 52112
- 🐙 GitHub: [@Viprasol-Tech](https://github.com/Viprasol-Tech) · 💼 [LinkedIn](https://www.linkedin.com/in/viprasol/) · 𝕏 [@viprasol](https://twitter.com/viprasol)

> *Viprasol Tech — fintech software, AI agents, algorithmic trading systems, and B2B SaaS. Need a custom build? [Get in touch](mailto:support@viprasol.com).*

> _Not affiliated with or endorsed by Anthropic, OpenAI, or any tool listed. "Agent Skills" is an open, cross-tool format._

## License
[MIT](LICENSE) © 2025 Viprasol Tech Private Limited
