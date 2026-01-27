# GettingOverItStats.Tests.ps1

Describe 'Get-StatsOverIt' {
    Mock Get-Item {
        $mockKey = [PSCustomObject]@{
            GetValue = {
                param($key)
                switch ($key) {
                    'BestTime_h2296154256' { [System.BitConverter]::DoubleToInt64Bits(3600.0) }
                    'LastTime_h313640666' { [System.BitConverter]::DoubleToInt64Bits(1800.0) }
                    'NumWins_h3927849616' { 5 }
                }
            }
        }
        return $mockKey
    }

    Mock Test-Path { return $true }

    It 'Returns stats as PSCustomObject' {
        $result = Get-StatsOverIt
        $result | Should -BeOfType PSCustomObject
        $result.BestTime.TotalSeconds | Should -Be 3600
        $result.LastTime.TotalSeconds | Should -Be 1800
        $result.NumPlaythrus | Should -Be 5
    }

    It 'Throws IOException if registry path not found' {
        Mock Test-Path { return $false }
        { Get-StatsOverIt } | Should -Throw [System.IO.IOException]
    }
}