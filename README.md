# MSPEngine (J1 MSP Toolkit)

Windows 10/11 provisioning and debloat utility for MSP technicians — one-click setup, hardening, and tuning.

![status](https://img.shields.io/badge/status-active-FFB300?style=flat-square)
![language](https://img.shields.io/badge/powershell-0d0d0c?style=flat-square)
![license](https://img.shields.io/badge/license-MIT-FFB300?style=flat-square)

## Overview

MSPEngine (branded "J1 MSP Toolkit") is a self-hosted PowerShell provisioning utility for MSP technicians that performs one-click Windows 10/11 setup — removing AppX bloatware, hardening services, tuning power settings, and preparing systems for production deployment. Supports remote execution via URL download for technician scenarios.

## Features

- One-click provisioning — single PowerShell script for full Windows setup
- AppX bloatware removal — removes pre-installed Windows Store apps and Xbox bloatware
- Service hardening — ensures essential services (Print Spooler) are enabled and automatic
- Power tuning — applies high performance or balanced power scheme
- Restart-friendly — no background service required; run from any PowerShell prompt
- Remote execution — deploy via URL download for remote technician scenarios

## What It Does

| Step | Action |
|------|--------|
| 1 | Downloads MSP-Ultra-Debloat.ps1 utility |
| 2 | Removes AppX packages (system bloatware) |
| 3 | Removes Xbox-related applications and services |
| 4 | Ensures Print Spooler service is enabled and running |
| 5 | Sets power scheme to High Performance or Balanced |
| 6 | System is ready for production deployment |

## System Requirements

- Windows 10 or Windows 11
- PowerShell 5.1+
- Administrator privileges

## Installation

```powershell
# Run from an elevated PowerShell prompt
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
.\install.ps1
```

Or remote execution:
```powershell
irm https://raw.githubusercontent.com/OneByJorah/MSPEngine/main/install.ps1 | iex
```

## License

MIT — see [LICENSE](LICENSE).

---
Part of the JorahOne / J1 ecosystem — streamlined Windows provisioning for MSPs.
