# JorahOne Universal Installer
Write-Host "Starting JorahOne MSP Toolkit..."

$scriptURL = "https://raw.githubusercontent.com/YOURUSERNAME/JorahOne-MSP/main/debloat/MSP-Ultra-Debloat.ps1"
$tempFile = "$env:TEMP\debloat.ps1"

Invoke-WebRequest $scriptURL -OutFile $tempFile
powershell -ExecutionPolicy Bypass -File $tempFile
