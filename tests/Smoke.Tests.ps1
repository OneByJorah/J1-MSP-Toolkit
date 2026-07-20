<#
.SYNOPSIS
    MSPEngine smoke test — syntax/parse lint for all PowerShell scripts.
.DESCRIPTION
    Validates that every .ps1 in the repo parses without errors. Does not
    execute Windows-native cmdlets (those require Windows). Run with:
      pwsh -NoProfile -File tests/Smoke.Tests.ps1
#>
$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$scripts = Get-ChildItem -Path $repoRoot -Filter *.ps1 -Recurse -File |
    Where-Object { $_.FullName -notmatch [regex]::Escape((Join-Path $repoRoot "tests")) }

$failures = 0
foreach ($s in $scripts) {
    try {
        $null = [System.Management.Automation.Language.Parser]::ParseFile($s.FullName, [ref]$null, [ref]$null)
        Write-Host "[PASS] parse: $($s.FullName.Replace($repoRoot,'').TrimStart('\','/'))" -ForegroundColor Green
    } catch {
        Write-Host "[FAIL] parse: $($s.FullName) -> $_" -ForegroundColor Red
        $failures++
    }
}

if ($failures -gt 0) {
    Write-Host "$failures script(s) failed to parse." -ForegroundColor Red
    exit 1
}
Write-Host "All PowerShell scripts parsed successfully." -ForegroundColor Green
