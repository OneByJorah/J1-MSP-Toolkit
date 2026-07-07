Write-Host "Starting MSPEngine..."

$scriptURL = "https://raw.githubusercontent.com/OneByJorah/MSPEngine/main/debloat/MSP-Ultra-Debloat.ps1"
$temp = "$env:TEMP\debloat.ps1"

Invoke-WebRequest $scriptURL -OutFile $temp
powershell -ExecutionPolicy Bypass -File $temp
