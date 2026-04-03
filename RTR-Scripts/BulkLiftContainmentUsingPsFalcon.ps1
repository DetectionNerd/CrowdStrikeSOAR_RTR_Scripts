#Requires -Version 5.1
using module @{ ModuleName = 'PSFalcon'; ModuleVersion = '2.0' }
param(
[Parameter(Mandatory = $true)]
[ValidatePattern('\.csv$')]
[string] $Path
)
$OutputFile = "Containment_$(Get-Date -Format FileDateTime).csv"
[array] $Hostnames = (Import-Csv $Path).Hostname
$Hosts = for ($i = 0; $i -lt $Hostnames.count; $i += 20) {
# Retrieve the device_id for hostnames in groups of 20

$Filter = ($Hostnames[$i..($i + 19)] | ForEach-Object {
if ($_ -ne '') {
"hostname:['$_']"
}
}) -join ','
$Output = Get-FalconHost -Filter $Filter -Detailed | Select-Object hostname, device_id
$Output | ForEach-Object {
# Add property for each host to update after containment request
$_.PSObject.Properties.Add((New-Object PSNoteProperty('Contain_Requested', $false)))
}
$Output
}
# Contain hosts and add status
Invoke-falconhostaction -Name lift_containment -Ids $Hosts.device_id | ForEach-Object {
$Id = $_.id
($Hosts | Where-Object { $_.device_id -eq $Id }).Contain_Requested = $true
}
$Hosts | Export-Csv -Path $OutputFile -NoTypeInformation
if (Test-Path $OutputFile) {
Get-ChildItem $OutputFile
}
