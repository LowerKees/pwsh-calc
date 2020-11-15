try {
    Import-Module Pester -MinimumVersion 5.0.0 -ErrorAction Stop
}
catch {
    Write-Warning "Please install the PowerShell module 'Pester' 5.0.0 or higher"
    Write-Warning "Now exiting the unit test program without running tests"
    return
}

$Config = [PesterConfiguration]::new()
$Config.Debug.ReturnRawResultObject = $true
$Config.Run.Path = $PSScriptRoot
$Config.TestResult.OutputFormat = 'NUnitXml'
$Config.TestResult.OutputPath = "$PSScriptRoot\pester-result.xml"

Invoke-Pester -Configuration $Config