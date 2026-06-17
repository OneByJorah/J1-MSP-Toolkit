Write-Host "Starting J1-MSP-Toolkit..."

$scriptURL = "https://raw.githubusercontent.com/OneByJorah/J1-MSP-Toolkit/main/debloat/MSP-Ultra-Debloat.ps1"
$temp = "$env:TEMP\debloat.ps1"

Invoke-WebRequest $scriptURL -OutFile $temp
powershell -ExecutionPolicy Bypass -File $temp
