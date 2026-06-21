# J1 MSP Toolkit — MSP Ultra Debloat

**Version:** v1.0  
**Status:** Active Development  
**Repository:** https://github.com/OneByJorah/J1-MSP-Toolkit

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Technology Stack](#technology-stack)
- [Features](#features)
- [Getting Started](#getting-started)
- [Service Management](#service-management)
- [Project Structure](#project-structure)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)
- [Author](#author)

---

## Overview

J1 MSP Toolkit is a lightweight Windows MSP support script: remove bloatware, normalize power settings, and prepare customer machines with one PowerShell launcher. It pulls the latest debloat script from this repo and runs it non-interactively.

Designed for MSP technicians who want a single entry point for Windows provisioning.

---

## Architecture

`install.ps1` downloads `debloat/MSP-Ultra-Debloat.ps1` to `%TEMP%` and executes it with bypassed execution policy.

The debloat script removes AppX packages (including Xbox bloat), ensures the Print Spooler is running and set to Automatic, and applies the balanced power scheme (`SCHEME_MIN`).

---

## Technology Stack

| Layer | Stack |
|---|---|
| Runtime | Windows 10/11 (PowerShell 5.1+) |
| Packaging | PowerShell script |
| VCS | Git + GitHub (`github.com/OneByJorah/J1-MSP-Toolkit`) |

---

## Features

- **One-click debloat**: downloads and runs the latest script from GitHub main.
- **Bloatware removal**: removes Xbox and other common AppX bloat.
- **Service hardening**: ensures Print Spooler is enabled.
- **Power tuning**: applies `SCHEME_MIN` power plan.
- **MSP-friendly**: non-interactive and restart-friendly.

---

## Getting Started

```powershell
# 1. Clone (or download ZIP)
git clone https://github.com/OneByJorah/J1-MSP-Toolkit.git
cd J1-MSP-Toolkit

# 2. Run
.\install.ps1
```

> Requires an internet connection to reach GitHub for the script fetch.
> Run PowerShell as Administrator for full effect.

---

## Service Management

This is a one-shot provisioning script; no background service is installed.

```powershell
# Rerun after a reboot or on a new machine
.\install.ps1
```

---

## Project Structure

```
J1-MSP-Toolkit/
├── install.ps1                     # One-click download + execute launcher
├── debloat/
│   └── MSP-Ultra-Debloat.ps1       # Provisioning logic
└── README.md
```

---

## Screenshots

_(Screenshots will be added after build/run capture.)_

---

## Contributing

1. Create a feature branch off `main`.
2. Keep the debloat script idempotent where possible.
3. Submit a PR with description and before/after screenshots for changes.

---

## License

MIT

---

## Author

Built by **Jhonattan L. Jimenez**.
