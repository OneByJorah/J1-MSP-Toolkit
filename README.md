<div align="center">
  <img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white">
  <img src="https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white">
  <img src="https://img.shields.io/badge/license-MIT-blue?style=for-the-badge">
</div>

<br>

<div align="center">
  <h1>🔧 MSPEngine</h1>
  <p><strong>Windows 10/11 Provisioning &amp; Debloat Utility for MSP Technicians</strong></p>
  <p>One-click Windows provisioning — debloat, harden, and tune for production use</p>
  <p>
    <a href="#-features">Features</a> •
    <a href="#-quick-start">Quick Start</a> •
    <a href="#-what-it-does">What It Does</a> •
    <a href="#-remote-execution">Remote Execution</a>
  </p>
</div>

---

## ✨ Features

- **One-Click Provisioning** — Single PowerShell script for full Windows setup
- **AppX Bloatware Removal** — Removes Xbox-related AppX packages
- **Service Hardening** — Ensures essential services (Print Spooler) are enabled and automatic
- **Power Tuning** — Applies High Performance power scheme
- **Restart-Friendly** — No background service installation required; run from any PowerShell prompt
- **Remote Execution** — Deploy via URL download — perfect for remote technician scenarios

## 🚀 Quick Start

Run this one-liner from an **elevated PowerShell** prompt on any Windows 10/11 machine:

```powershell
# One-liner for MSP technician use — downloads and executes the toolkit
iex ((New-Object System.Net.WebClient).DownloadString(
  'https://raw.githubusercontent.com/OneByJorah/MSPEngine/main/install.ps1'
))
```

Alternatively, clone the repo and run locally:

```powershell
# Local execution from an elevated PowerShell prompt
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
.\install.ps1
```

## 🔧 What It Does

| Step | Action |
|------|--------|
| 1 | Downloads MSP-Ultra-Debloat.ps1 utility |
| 2 | Removes Xbox-related AppX packages (bloatware) |
| 3 | Ensures Print Spooler service is enabled and running |
| 4 | Sets power scheme to High Performance |
| 5 | System is ready for production deployment |

## 🌐 Remote Execution

For remote technician scenarios, use the one-liner in [Quick Start](#-quick-start) from an elevated PowerShell session. No USB, no SCCM, no RMM agent required — ideal for break-fix and rapid provisioning.

## 📁 Project Structure

```
|MSPEngine/
├── install.ps1                    # Bootstrap installer — downloads and executes debloat script
├── debloat/
│   └── MSP-Ultra-Debloat.ps1     # Core debloat utility — removes Xbox bloat, enables services
├── INTENT.md                      # Engineering intent reconstruction
├── README.md                      # Primary documentation (this file)
├── CHANGELOG.md                   # Release history
├── ROADMAP.md                     # Future direction
├── CONTRIBUTING.md                # Contribution guidelines
├── SECURITY.md                    # Security policy & disclosure
├── CODE_OF_CONDUCT.md             # Community standards
├── LICENSE                        # MIT License
├── j1.yaml                        # J1-PIPELINE registry
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

## 📄 License

MIT © Jhonattan L. Jimenez

---

<div align="center">
  <p>⚡ Fast Windows provisioning for MSPs</p>
  <p><a href="https://github.com/OneByJorah">@OneByJorah</a></p>
</div>
