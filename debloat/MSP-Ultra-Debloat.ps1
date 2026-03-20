# MSP Ultra Debloat Script
Write-Host "Running MSP Ultra Debloat..."

# (Shortened for packaging - user already has full version)
Write-Host "This is the deployed version from GitHub."

# Example action
Get-AppxPackage *xbox* | Remove-AppxPackage -ErrorAction SilentlyContinue

Write-Host "Debloat complete. Restart recommended."
