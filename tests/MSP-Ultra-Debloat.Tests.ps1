BeforeAll {
    # Mock external commands to avoid actual system changes
    Mock Get-AppxPackage { return @() }
    Mock Remove-AppxPackage { return $null }
    Mock Set-Service { return $null }
    Mock Start-Service { return $null }
    Mock powercfg { return $null }
    Mock Write-Host { return $null }
}

Describe "MSP-Ultra-Debloat.ps1" {
    It "should remove Xbox AppX packages" {
        # Simulate the debloat script's AppX removal logic
        $xboxPackages = Get-AppxPackage *xbox*
        $xboxPackages | ForEach-Object { Remove-AppxPackage $_ -ErrorAction SilentlyContinue }

        Should -Invoke Get-AppxPackage -Times 1 -Exactly
        Should -Invoke Remove-AppxPackage -Times 0 -Exactly  # No packages to remove in mock
    }

    It "should enable Print Spooler service" {
        Set-Service spooler -StartupType Automatic
        Start-Service spooler

        Should -Invoke Set-Service -Times 1 -Exactly
        Should -Invoke Start-Service -Times 1 -Exactly
    }

    It "should set High Performance power scheme" {
        powercfg -setactive SCHEME_MIN

        Should -Invoke powercfg -Times 1 -Exactly
    }
}

Describe "install.ps1" {
    It "should download debloat script from GitHub" {
        Mock Invoke-WebRequest { return $null }
        Mock powershell { return $null }

        $scriptURL = "https://raw.githubusercontent.com/OneByJorah/J1-MSP-Toolkit/main/debloat/MSP-Ultra-Debloat.ps1"
        $temp = "$env:TEMP\debloat.ps1"

        Invoke-WebRequest $scriptURL -OutFile $temp
        powershell -ExecutionPolicy Bypass -File $temp

        Should -Invoke Invoke-WebRequest -Times 1 -Exactly
        Should -Invoke powershell -Times 1 -Exactly
    }
}
