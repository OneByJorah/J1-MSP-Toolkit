# MSPEngine — syntax-validated PowerShell image
# This is a Windows-native toolkit (AppX / services / powercfg). The container
# cannot run those cmdlets on Linux, but it provides a reproducible way to
# syntax-check the scripts and serves as the documented CI/runtime baseline.
FROM mcr.microsoft.com/powershell:latest

# Create a non-root user for the validation runtime
RUN useradd --create-home --uid 10001 msp
USER msp
WORKDIR /home/msp

COPY --chown=msp:msp install.ps1 ./
COPY --chown=msp:msp debloat/ ./debloat/
COPY --chown=msp:msp tests/ ./tests/

# Validate that all scripts parse on container build (fails the build on error)
RUN pwsh -NoProfile -Command '\
$ErrorActionPreference="Stop"; \
$files = @("install.ps1","debloat/MSP-Ultra-Debloat.ps1"); \
foreach ($f in $files) { [void][System.Management.Automation.Language.Parser]::ParseFile($f,[ref]$null,[ref]$null) }; \
Write-Host "MSPEngine: all scripts parsed OK"'

# Default: run the smoke test. Override ENTRYPOINT to inspect interactively.
ENTRYPOINT ["pwsh", "-NoProfile", "-File", "tests/Smoke.Tests.ps1"]
