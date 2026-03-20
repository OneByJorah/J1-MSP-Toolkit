Write-Host "Running MSP ULTRA Debloat..."

Get-AppxPackage *xbox* | Remove-AppxPackage -ErrorAction SilentlyContinue

Set-Service spooler -StartupType Automatic
Start-Service spooler

powercfg -setactive SCHEME_MIN

Write-Host "Done. Restart recommended."
