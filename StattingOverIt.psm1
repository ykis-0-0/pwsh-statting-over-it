<#
.SYNOPSIS
    Retrieves gameplay statistics from Getting Over It registry.
#>

function Get-GoIRegistyValue {
    <#
    .SYNOPSIS
        Retrieves a specific value from the Getting Over It registry key.
    #>

    param (
        # Registry Key to read from
        [Parameter(Mandatory = $true)]
        [Microsoft.Win32.RegistryKey] $RegistryKey,

        # Name of the value to retrieve
        [Parameter(Mandatory = $true)]
        [string] $ValueName
    )

    $value = $RegistryKey.GetValue($ValueName)
    if ($value -eq $null) {
        throw [System.IO.IOException]::new("Key not found in registry: [$ValueName]")
    }

    return $value
}

function Get-StatsOverIt {
    [CmdletBinding()]
    param()

    $KeyPath = "HKCU:\SOFTWARE\Bennett Foddy\Getting Over It"

    if (-not (Test-Path $KeyPath)) {
        throw [System.IO.IOException]::new("Registry path not found: $KeyPath")
    }

    $RegKey = Get-Item $KeyPath

    $NumPlaythrus = Get-GoIRegistyValue -RegistryKey $RegKey -ValueName 'NumWins_h3927849616'

    $BestTimeBytes = Get-GoIRegistyValue -RegistryKey $RegKey -ValueName 'BestTime_h2296154256'
    $BestTime = [timespan]::FromSeconds(
        [System.BitConverter]::Int64BitsToDouble($BestTimeBytes)
    )

    $LastTimeBytes = Get-GoIRegistyValue -RegistryKey $RegKey -ValueName 'LastTime_h313640666'
    $LastTime = [timespan]::FromSeconds(
        [System.BitConverter]::Int64BitsToDouble($LastTimeBytes)
    )

    Write-Host ("Number of Playthroughs: {0}" -f $NumPlaythrus)
    Write-Host ("Best Time: {0}" -f $BestTime.ToString("m\:ss\.fff"))
    Write-Host ("Time of Last Run: {0}" -f $LastTime.ToString("m\:ss\.fff"))

    return [PSCustomObject]@{
        NumPlaythrus = $NumPlaythrus
        BestTime     = $BestTime
        LastTime     = $LastTime
    }
}

Export-ModuleMember -Function Get-StatsOverIt