Write-Host "Starting JorahOne MSP Toolkit..."

$scriptURL = "https://raw.githubusercontent.com/onebyjorah/JorahOne-MSP/main/debloat/MSP-Ultra-Debloat.ps1"
$temp = "$env:TEMP\debloat.ps1"

Invoke-WebRequest $scriptURL -OutFile $temp
powershell -ExecutionPolicy Bypass -File $temp
