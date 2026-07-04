<div align="center">
  <img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white">
  <img src="https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white">
  <img src="https://img.shields.io/badge/MSP-00A4EF?style=for-the-badge&logo=microsoft&logoColor=white">
</div>

<br>

<div align="center">
  <h1>🔧 J1 MSP Toolkit</h1>
  <p><strong>Lightweight PowerShell Provisioning & Debloat Utility for MSP Technicians</strong></p>
  <p>One-click Windows 10/11 provisioning — debloat, harden, and tune</p>
  <p>
    <a href="#-features">Features</a> •
    <a href="#-quick-start">Quick Start</a> •
    <a href="#-what-it-does">What It Does</a>
  </p>
</div>

---

## ✨ Features

- **One-Click Provisioning** — Single PowerShell script for full setup
- **Debloat** — Removes AppX packages, Xbox bloatware
- **Service Hardening** — Ensures Print Spooler is enabled and automatic
- **Power Tuning** — Applies high performance/balanced power scheme
- **Restart-Friendly** — No background service installation required
- **Remote Execution** — Download and execute debloat script from URL

## 🚀 Quick Start

```powershell
# Run from an elevated PowerShell prompt
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
.\install.ps1
```

Or download and execute remotely:
```powershell
# One-liner for technician use
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/OneByJorah/J1-MSP-Toolkit/main/install.ps1'))
```

## 🔧 What It Does

| Step | Action |
|------|--------|
| 1 | Downloads MSP-Ultra-Debloat.ps1 |
| 2 | Removes AppX packages (bloatware) |
| 3 | Removes Xbox-related items |
| 4 | Ensures Print Spooler is enabled |
| 5 | Sets power scheme to high performance |
| 6 | System ready for production use |

## 📄 License

MIT © Jhonattan L. Jimenez

---

<div align="center">
  <p>⚡ Fast Windows provisioning for MSPs</p>
  <p><a href="https://github.com/OneByJorah">@OneByJorah</a></p>
</div>
