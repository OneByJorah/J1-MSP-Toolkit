# 🚀 JorahOne MSP Toolkit

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-5391FE?logo=powershell)](https://github.com/PowerShell/PowerShell)
[![Windows](https://img.shields.io/badge/Windows-10%2F11%2FServer-0078D6?logo=windows)](https://www.microsoft.com/windows)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Maintained by OneByJorah](https://img.shields.io/badge/Maintained%20by-OneByJorah-1E90FF?logo=github)](https://github.com/OneByJorah)

---

## 📋 Overview

**JorahOne MSP Toolkit** is a collection of PowerShell tools designed for **Managed Service Providers** and IT professionals. Streamline Windows deployment, debloating, and performance optimization across client machines with one-line remote execution.

> **Built by [OneByJorah](https://github.com/OneByJorah) for MSPs and IT administrators.**

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🧹 **Ultra Debloat** | Removes bloatware, telemetry, and unnecessary Windows components |
| ⚡ **Performance Optimization** | Tunes system settings for maximum performance |
| 🏢 **Business Safe** | Preserves Microsoft Edge, printing, and business-critical features |
| 🌐 **Remote Execution** | Deploy via one-liner from any remote session |
| 🔄 **Reversible** | Creates system restore point before making changes |

---

## 📁 Project Structure

```
J1-MSP-Toolkit/
├── install.ps1              # Main installer (remote execution entry point)
├── debloat/
│   └── MSP-Ultra-Debloat.ps1  # Core debloat script
└── README.md                # This file
```

---

## ⚡ One-Line Deployment

### Remote Execution (Recommended)

From any PowerShell session with admin rights:

```powershell
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/OneByJorah/J1-MSP-Toolkit/main/install.ps1 | iex"
```

### Local Execution

```powershell
# Clone the repository
git clone https://github.com/OneByJorah/J1-MSP-Toolkit.git
cd J1-MSP-Toolkit

# Run as Administrator
powershell -ExecutionPolicy Bypass -File install.ps1
```

---

## 📋 Prerequisites

| Requirement | Details |
|-------------|---------|
| **OS** | Windows 10, Windows 11, or Windows Server 2019+ |
| **PowerShell** | 5.1 or higher |
| **Permissions** | Administrator / Run as Admin |
| **Network** | Internet access (for remote execution) |

---

## 🔧 What Gets Removed

### Bloatware
- Xbox apps and services
- Cortana
- OneDrive (can be preserved)
- Pre-installed third-party apps (Candy Crush, etc.)
- Windows Tips and suggestions
- Telemetry and diagnostic data

### Preserved (Business Safe)
- ✅ Microsoft Edge
- ✅ Print spooler and drivers
- ✅ Windows Update
- ✅ .NET Framework
- ✅ Windows Defender
- ✅ Remote Desktop

---

## ⚙️ Configuration

Edit `debloat/MSP-Ultra-Debloat.ps1` to customize:

```powershell
# Preserve OneDrive (default: removed)
$KeepOneDrive = $false

# Preserve Cortana (default: removed)
$KeepCortana = $false

# Create restore point (default: enabled)
$CreateRestorePoint = $true
```

---

## 🐛 Troubleshooting

| Problem | Solution |
|---------|----------|
| Script won't run | Ensure you're running as Administrator |
| Execution policy error | Use `-ExecutionPolicy Bypass` |
| App reinstalled by update | Re-run the debloat script after major updates |
| Restore point needed | System restore point is created automatically |

---

## 🔄 Updates

```powershell
# Re-run the installer to get the latest version
powershell -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/OneByJorah/J1-MSP-Toolkit/main/install.ps1 | iex"
```

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -m 'Add improvement'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Open a Pull Request

---

## 📄 License

MIT License — free to use, modify, and distribute.

---

## ⚠️ Disclaimer

This tool modifies system settings and removes Windows components. Always test in a non-production environment first. A system restore point is created automatically before changes are made.

---

## 📞 Support

For issues or questions, please open an issue on GitHub:

https://github.com/OneByJorah/J1-MSP-Toolkit/issues

---

**Made with ❤️ by [OneByJorah](https://github.com/OneByJorah)**
