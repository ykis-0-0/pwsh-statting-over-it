# Copilot Instructions for Getting Over It Registry Stats Module

## Project Overview
This is a minimal PowerShell module that reads Windows Registry keys to extract gameplay statistics from "Getting Over It with Bennett Foddy". Designed for PowerShell 5.1+ on Windows 10 22H2, focusing on standard compliance and simplicity.

## Architecture
- **Module Structure**: Single `.psm1` file with exported functions, paired with a `.psd1` manifest for metadata.
- **Registry Path**: Target `HKCU:\SOFTWARE\Bennett Foddy\Getting Over It` for game stats.
- **Data Flow**: Functions query registry values, convert to PowerShell custom objects, and output statistics (e.g., total playtime, hammer hits, progress percentage).

## Key Patterns
- **Function Design**: Use approved verbs like `Get-GameStats`, `Get-PlayTime`. Accept optional parameters for filtering (e.g., `-User` for multi-user support).
- **Registry Access**: Use `Get-ItemProperty` with error handling; check path existence with `Test-Path`.
- **Output Format**: Return `[PSCustomObject]` with properties like `PlayTime`, `HammerHits`, `Progress`.
- **Error Handling**: Throw `[System.IO.IOException]` for missing registry keys; use `Write-Warning` for non-critical issues.

## Developer Workflows
- **Testing**: Use Pester for unit tests; mock `Get-ItemProperty` to simulate registry data.
- **Debugging**: Enable `$DebugPreference = 'Continue'`; add `Write-Debug` statements for registry value dumps.
- **Validation**: Run `PSScriptAnalyzer` on `.psm1` to enforce style (e.g., avoid `Write-Host`).

## Conventions
- **Code Style**: 4-space indentation, PascalCase for functions/properties, consistent parameter naming.
- **Dependencies**: No external modules; rely on core PowerShell cmdlets.
- **Integration**: Module imports via `Import-Module`; functions pipeable for chaining (e.g., `Get-GameStats | Where-Object Progress -gt 50`).

## Examples
- **Basic Query**: `Get-GameStats` returns all stats as an object.
- **Specific Stat**: `Get-PlayTime -AsSeconds` converts registry DWORD to total seconds played.