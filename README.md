<!-- j1-brand:v2 -->
<div align="center">

# J1-MSP-Toolkit

A PowerShell-based Windows 10/11 provisioning and debloating toolkit for MSP technicians — one-click setup, bloatware removal, service hardening, and power tuning.

[![GitHub](https://img.shields.io/badge/github-OneByJorah%2FJ1--MSP--Toolkit-FFB300?style=for-the-badge&labelColor=0d0d0c)](https://github.com/OneByJorah/J1-MSP-Toolkit)
[![License](https://img.shields.io/badge/license-MIT-FFB300?style=for-the-badge&labelColor=0d0d0c)](LICENSE)
[![Language](https://img.shields.io/badge/PowerShell-FFB300?style=for-the-badge&labelColor=0d0d0c)](https://learn.microsoft.com/en-us/powershell/)
[![Built by](https://img.shields.io/badge/built%20by-JorahOne%20LLC-FFB300?style=for-the-badge&labelColor=0d0d0c)](https://github.com/OneByJorah)

</div>

---

## Why This Exists

MSPs deploy and re-deploy Windows machines constantly. Each one needs bloatware stripped, services hardened, and power settings tuned — a repetitive, error-prone manual process. The J1-MSP-Toolkit automates it: one PowerShell script that debloats, hardens critical services, configures power schemes, and prepares Windows for production use.

## Key Features

| Feature | Why It Matters |
|---|---|
| One-click setup | Single PowerShell script for full deployment |
| Bloatware removal | Strips pre-installed Windows Store apps and Xbox bloatware |
| Service hardening | Ensures critical services (Print Spooler, etc.) are set correctly |
| Power tuning | Configures high-performance or balanced power schemes |
| Remote execution ready | Run via URL — no manual file copy needed |

## Quick Start

Run in an elevated PowerShell prompt (as Administrator):

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
.\install.ps1
```

## Documentation

| Doc | Description |
|---|---|
| [Usage Guide](docs/usage.md) | Running the toolkit and available options |
| [Customization](docs/customization.md) | Tailoring the debloat and hardening lists |

---

## License

MIT © JorahOne, LLC — see [LICENSE](LICENSE)

<sub>Part of the JorahOne infrastructure ecosystem.</sub>
