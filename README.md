> This README is AI-generated, I'm too lazy to write one, so don't trust 100% of it (I'd say 80% of below is credible tho)

# Getting Over It Registry Stats Module

This is a PowerShell module that retrieves gameplay statistics from the Windows Registry for the game "Getting Over It with Bennett Foddy".

## Installation

1. Download the `GettingOverItStats.psm1` and `GettingOverItStats.psd1` files.
2. Place them in a directory, e.g., `C:\Modules\GettingOverItStats\`.
3. Import the module: `Import-Module C:\Modules\GettingOverItStats\GettingOverItStats.psm1`

## Usage

### Get all stats
```powershell
Get-StatsOverIt
```

Returns a PSCustomObject with all registry values.

### Get playtime
```powershell
(Get-StatsOverIt).BestTime
```

Returns the BestTime value from registry.

```powershell
(Get-StatsOverIt).BestTime.TotalSeconds
```

Converts BestTime to seconds.

## Requirements

- PowerShell 5.1+
- Windows 10 22H2
- Access to HKCU registry

## Troubleshooting

- **Registry path not found**: Ensure the game has been played and stats are saved in the registry.
- **Access denied**: Run PowerShell as administrator.
- **Module not found**: Check the module path and ensure files are in the correct location.

## Testing

Run tests with Pester:
```powershell
Invoke-Pester .\GettingOverItStats.Tests.ps1
```