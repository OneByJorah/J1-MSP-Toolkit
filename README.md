<div align="center">
  <img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white">
  <img src="https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white">
  <img src="https://img.shields.io/badge/license-MIT-blue?style=for-the-badge">
</div>

<br>

<div align="center">
  <h1>🔧 J1 MSP Toolkit</h1>
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

## 📸 Screenshot

This is a CLI/backend-only tool. No screenshots available.

## ✨ Features

- **One-Click Provisioning** — Single PowerShell script for full Windows setup
- **AppX Bloatware Removal** — Removes pre-installed Windows Store apps and Xbox bloatware
- **Service Hardening** — Ensures essential services (Print Spooler) are enabled and automatic
- **Power Tuning** — Applies high performance or balanced power scheme
- **Restart-Friendly** — No background service installation required; run from any PowerShell prompt
- **Remote Execution** — Deploy via URL download — perfect for remote technician scenarios

## 🚀 Quick Start

```powershell
# Run from an elevated PowerShell prompt
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
.\install.ps1
```

## 🔧 What It Does

| Step | Action |
|------|--------|
| 1 | Downloads MSP-Ultra-Debloat.ps1 utility |
| 2 | Removes AppX packages (system bloatware) |
| 3 | Removes Xbox-related applications and services |
| 4 | Ensures Print Spooler service is enabled and running |
| 5 | Sets power scheme to High Performance or Balanced |
| 6 | System is ready for production deployment |

## 📋 System Requirements

| Requirement | Details |
|-------------|---------|
| **OS** | Windows 10 (1809+) or Windows 11 |
| **PowerShell** | 5.1 or later |
| **Privileges** | Administrator (elevated) access required |
| **Architecture** | x64 (x86 supported but not recommended) |
| **Network** | Internet access to download scripts from GitHub |
| **Containerization** | ❌ **Not supported** — This is a Windows-native PowerShell toolkit. It cannot be containerized or run on Linux/macOS. |

> **Note:** J1-MSP-Toolkit is a **Windows-only** utility. It interacts directly with Windows system services, AppX packages, and power management — none of which are available in Docker/Linux environments. For remote execution, use the one-liner below or deploy via RMM tools.

## 🌐 Remote Execution

For remote technician scenarios, download and execute directly:

```powershell
# One-liner for MSP technician use
iex ((New-Object System.Net.WebClient).DownloadString(
  'https://raw.githubusercontent.com/OneByJorah/J1-MSP-Toolkit/main/install.ps1'
))
```

## 📁 Project Structure

```
J1-MSP-Toolkit/
├── install.ps1           # Main installation script
├── debloat/              # Debloat utility scripts
└── README.md
```

## 📄 License

MIT © Jhonattan L. Jimenez

---

<div align="center">
  <p>⚡ Fast Windows provisioning for MSPs</p>
  <p><a href="https://github.com/OneByJorah">@OneByJorah</a></p>
</div>
