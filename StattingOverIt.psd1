@{
    # RootModule = 'GoiStats.psm1'
    ModuleVersion = '0.0.1.1'
    # CompatiblePSEditions = @()

    GUID = 'fdc77fae-f53c-47e6-81fe-a5b585c6c70c'
    Author = '@ykis-0-0'
    # CompanyName = $null
    Copyright = '2026 @ykis-0-0, CC-BY-SA 4.0'
    Description = 'PowerShell Module for retrieving gameplay statistics from registry for the game Getting Over It with Bennett Foddy'
    PowerShellVersion = '5.1'
    PowerShellHostName = 'ConsoleHost' # Allow only local sessions

    FunctionsToExport = @('Get-StatsOverIt')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()

    PrivateData = @{}
}