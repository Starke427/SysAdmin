# Automate service management for Windows using a provided list of services.
# Author: Jeff Starke
#
# Usage: ./service_manager.ps1 [Start, Stop, Enable, Disable]

# Provide a comma separated list of services to automate.

param (
[Parameter(Mandatory=$true)]
[string] $Action
)

$serviceList="","",""


if ($Action -eq 'Stop')
{
  Foreach ($service in $serviceList)
  {
    $S = Get-Service -Name $service
    Set-Service -InputObject $S -Status Stopped
  }
}
elseif ($Action -eq 'Start')
{
  Foreach ($service in $serviceList)
  {
    Set-Service -Name $service -Status Running -PassThru
  }
}
elseif ($Action -eq 'Disable')
{
  Foreach ($service in $serviceList)
  {
    Set-Service -Name $service -StartupType Manual
    Get-Service $service | Select-Object -Property Name, StartType, Status
  }
}
elseif ($Action -eq 'Enable')
{
  Foreach ($service in $serviceList)
  {
    Set-Service -Name $service -StartupType Automatic
    Get-Service $service | Select-Object -Property Name, StartType, Status
  }
}
else
{
  Write-Host "Sorry, something went wrong. Please open in notepad and verify your service names."
}
