# J1 MSP Toolkit

> PowerShell toolkit for MSP automation, onboarding, and client management.

![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/status-active-%23FFB300?style=for-the-badge)
![Language](https://img.shields.io/badge/language-Python-informational?style=for-the-badge)
![Platform](https://img.shields.io/badge/platform-linux-informational?style=for-the-badge)

J1 MSP Toolkit is an enterprise-grade, ops-precise platform built for VIDE and SMB operations. Run it solo. Deliver results.

- **One-click debloat**: downloads and runs the latest script from GitHub main.
- **Bloatware removal**: removes Xbox and other common AppX bloat.
- **Service hardening**: ensures Print Spooler is enabled.
- **Power tuning**: applies `SCHEME_MIN` power plan.
- **MSP-friendly**: non-interactive and restart-friendly.

---

## Architecture

`install.ps1` downloads `debloat/MSP-Ultra-Debloat.ps1` to `%TEMP%` and executes it with bypassed execution policy.

The debloat script removes AppX packages (including Xbox bloat), ensures the Print Spooler is running and set to Automatic, and applies the balanced power scheme (`SCHEME_MIN`).

---

| Layer | Stack |
|---|---|
| Runtime | Windows 10/11 (PowerShell 5.1+) |
| Packaging | PowerShell script |
| VCS | Git + GitHub (`github.com/OneByJorah/J1-MSP-Toolkit`) |

---

## Quickstart

```bash
git clone https://github.com/OneByJorah/J1-MSP-Toolkit.git
cd J1-MSP-Toolkit
# Follow in-repo setup instructions
```
Verify by checking service health or running the in-repo test command.

## Roadmap

- Feature parity with production requirements
- Observability and alerting expansions
- Community feedback integration

## License

MIT — Copyright JorahOne, LLC. See [LICENSE](LICENSE) for details.

---

[OneByJorah](https://github.com/OneByJorah) · [JorahOne-Services](https://github.com/JorahOne-Services)
