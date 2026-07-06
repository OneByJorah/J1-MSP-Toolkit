# INTENT.md — J1-PIPELINE Phase -1 (ORACLE)

**Repository:** `OneByJorah/J1-MSP-Toolkit`
**Analysis Date:** 2026-07-05
**Analyst:** J1-PIPELINE ORACLE (read-only)
**Status:** Intent Reconstructed

---

## What This System Does

### Technical Role

J1-MSP-Toolkit is a **Windows 10/11 provisioning and debloat utility** for Managed Service Provider (MSP) technicians. It is a two-script PowerShell toolchain:

| Script | Role | Action |
|--------|------|--------|
| `install.ps1` | Bootstrap / Launcher | Downloads the debloat script from GitHub raw, then executes it locally |
| `debloat/MSP-Ultra-Debloat.ps1` | Core utility | Removes Xbox AppX bloatware, enables Print Spooler, sets High Performance power scheme |

The system has no persistent services, no daemons, no background agents. It is a **fire-and-forget provisioning step** — run once per machine during initial setup.

### Operational Role

Used by MSP technicians to rapidly prepare Windows 10/11 workstations for production deployment. The workflow:

1. Technician opens an **elevated PowerShell** prompt on a target machine (local or remote)
2. Runs a **one-liner** that downloads and executes the toolkit
3. The toolkit removes consumer bloatware (Xbox apps), ensures critical business services (Print Spooler) are enabled, and applies a performance-optimized power plan
4. Machine is ready for production use

Designed for **remote execution** — the one-liner fetches from `raw.githubusercontent.com`, so no USB, no SCCM, no RMM agent is required. This makes it ideal for break-fix scenarios, rapid provisioning, and technician toolkits.

---

## Why This Was Built

### Real Problem

MSP technicians provisioning Windows 10/11 workstations face a repetitive manual checklist:
- Remove pre-installed Xbox and consumer bloatware that wastes disk/CPU
- Ensure the Print Spooler service is running (commonly disabled by debloat scripts or group policy, breaking business printing)
- Set the power plan to High Performance (Windows defaults to Balanced, which can throttle CPU-bound workloads)
- Do all of this across dozens or hundreds of machines, often remotely

Each step is trivial individually, but the cumulative manual effort across a fleet is significant, and forgetting any step causes downstream support tickets.

### Why Existing Tools Were Insufficient

| Tool | Gap |
|------|-----|
| **Windows OOBE / Sysprep** | Requires image preparation; not suitable for ad-hoc or remote one-off machines |
| **SCCM / Intune** | Heavy infrastructure; overkill for break-fix or small-shop MSP scenarios |
| **Chris Titus Windows Utility** | Feature-rich but opinionated — disables services (including Print Spooler) that MSPs need for business environments |
| **O&O ShutUp10++** | GUI-only; not scriptable for remote one-liner execution |
| **Manual PowerShell** | No standardized, maintained, version-controlled script that MSPs can trust and audit |

No existing tool provided a **minimal, auditable, one-liner PowerShell script** that specifically:
- Removes only Xbox bloatware (not business-critical components)
- Explicitly **enables** Print Spooler (many debloat tools disable it)
- Sets High Performance power plan
- Is hosted on GitHub for transparency, versioning, and community contribution

### What Triggered Development

The creation of the **JorahOne (OneByJorah) ecosystem** created a need for a standardized, lightweight Windows provisioning tool that:
- Could be referenced and trusted across JorahOne projects
- Followed JorahOne's security and documentation standards
- Served as a foundational building block for MSP service offerings
- Could be audited, forked, and improved by the community

The initial commit (`ca89ad3 "Add files via upload"`) shows the repo was created by uploading existing scripts, then iteratively documented and standardized through multiple README revisions and a security audit. The repo was later renamed from an original name (commits `f5263b9`, `851e786`) to `J1-MSP-Toolkit`.

### Ecosystem Fit

```
JorahOne / OneByJorah Ecosystem
├── J1-MSP-Toolkit          ← Windows provisioning utility (this repo)
├── J1-Hermes-Agent         ← AI agent orchestration (sibling)
├── J1-* (other repos)      ← JorahOne infrastructure & tooling
└── MSP Service Offerings    ← Downstream consumers of provisioned Windows workstations
```

This is a **standalone utility** within the JorahOne portfolio — it has no runtime dependencies on other JorahOne repos and is designed to be consumed directly by MSP technicians, not by other software systems.

---

## Operational Classification

**Classification: PRODUCTION**

Evidence:
- **Version declared**: v1.0.0 in CHANGELOG.md (2026-07-04) — though not yet tagged in git
- **Security scanning**: CodeQL analysis via GitHub Actions (weekly + on push/PR)
- **Dependency management**: Dependabot configured for GitHub Actions
- **Security policy**: Published SECURITY.md with 48h acknowledgment SLA, 90-day disclosure timeline, dedicated security contact
- **Community governance**: CODE_OF_CONDUCT, CONTRIBUTING.md, issue/PR templates
- **License**: MIT (permissive, production-safe)
- **Security audit performed**: Commit `364a6ec` sanitized email references — evidence of proactive security hygiene
- **No live deployment dependency**: Runs directly from `raw.githubusercontent.com` — no server, no database, no API key required
- **Minimal attack surface**: 2 scripts, ~17 lines total, no external dependencies beyond PowerShell built-ins

---

## Key Architectural Decisions

1. **Two-script architecture (installer + debloat)** — Separates the bootstrap concern (download/execute) from the actual debloat logic. This allows the debloat script to be updated independently without changing the installer URL, and keeps the installer small enough to paste into a one-liner.

2. **Remote execution via `Invoke-WebRequest`** — The installer fetches the debloat script from GitHub raw at runtime rather than bundling it. This ensures the latest version is always used, and keeps the one-liner short enough for practical MSP use.

3. **Minimal, targeted debloat** — Only removes Xbox AppX packages (`*xbox*`). Unlike aggressive debloat tools, it does not remove Store, Calculator, Notepad, or other potentially useful apps. This is a deliberate tradeoff: preserve business utility while removing the most egregious consumer bloat.

4. **Explicit Print Spooler enablement** — Many debloat guides recommend disabling Print Spooler for security. This script does the opposite, reflecting the MSP use case where printing is a core business requirement.

5. **Power scheme via `powercfg`** — Uses `SCHEME_MIN` (GUID for High Performance) rather than `SCHEME_MAX` (Ultimate Performance) to avoid excessive power draw on laptops while still prioritizing performance over Balanced.

6. **No background service, no persistence** — The script runs once and exits. No scheduled tasks, no services, no registry watchers. This is intentional: MSPs want a clean, auditable one-time operation, not a persistent agent.

---

## Repository Structure

```
J1-MSP-Toolkit/
├── install.ps1                    # Bootstrap installer (7 lines)
├── debloat/
│   └── MSP-Ultra-Debloat.ps1     # Core debloat utility (10 lines)
├── INTENT.md                      # This file — intent reconstruction
├── README.md                      # Primary documentation
├── CHANGELOG.md                   # Release history (v1.0.0 declared)
├── ROADMAP.md                     # Future direction
├── CONTRIBUTING.md                # Contribution guidelines
├── SECURITY.md                    # Security policy & disclosure
├── CODE_OF_CONDUCT.md             # Community standards
├── LICENSE                        # MIT License
├── .gitignore                     # Git ignore rules
└── .github/
    ├── dependabot.yml             # Weekly GitHub Actions dependency updates
    ├── workflows/
    │   └── codeql.yml             # CodeQL security analysis
    ├── ISSUE_TEMPLATE/
    │   ├── bug_report.md          # Bug report template
    │   └── feature_request.md     # Feature request template
    └── PULL_REQUEST_TEMPLATE.md   # PR submission template
```

---

## Notes

- **No git tags exist** — CHANGELOG declares v1.0.0 but no corresponding tag was created. This should be resolved before the next release.
- **No `j1.yaml`** — The J1-PIPELINE registry file is absent. This repo has not yet been onboarded to the J1 pipeline.
- **No docs/ directory** — All documentation is in the README. No setup guides, troubleshooting docs, or integration guides exist beyond the README.
- **No test files** — No smoke tests, Pester tests, or any test infrastructure. The ROADMAP mentions "Test coverage expansion" as a current goal.
- **No Docker/compose files** — Expected; this is a native Windows PowerShell utility, not a containerized service.
- **No config files** — No `.env.example`, `settings.yml`, or configuration templates. The script has no configurable parameters.
- **Repo was renamed** — Git history shows the repo was renamed to `J1-MSP-Toolkit` from a previous name (commits `f5263b9`, `851e786`). The original name is not preserved in the history.
- **Initial commit is generic** — `ca89ad3 "Add files via upload"` provides no intent signal. Intent is reconstructed entirely from README, code, and subsequent commits.
- **Security audit performed** — Commit `364a6ec` sanitized email references, indicating proactive security review.
- **Branding alignment** — README consistently uses "J1 MSP Toolkit" brand, matching repo name. No naming discrepancy.
- **No CI beyond CodeQL** — No test runner, no linting, no build pipeline. CodeQL is the only automated check.
- **Bug report template references non-Windows environment fields** — The template asks for "OS: [e.g. Ubuntu 22.04]", "Python Version", and "Docker Version", which are irrelevant for a Windows PowerShell utility. This is a template vestige from a generic J1 template.
