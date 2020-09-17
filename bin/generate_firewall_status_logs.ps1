## This script generates FirewallStatus.Log, useful to check the Firewall status. 

Set-Variable -Name "LogFolder" -Value "$SplunkHome\var\log\windows_custom_powershell_scripts"
Set-Variable -Name "LogFile" -Value "$SplunkHome\var\log\windows_custom_powershell_scripts\FirewallStatus.log"

if (!(Test-Path -Path $LogFolder )) {
	New-Item -ItemType directory -Path $LogFolder
}

NetSh Advfirewall show allprofiles state | Out-File -encoding utf8 "$LogFile"

# Get-WindowsUpdateLog -LogPath $LogFolder\WindowsUpdate.log

# if ([System.IO.File]::Exists("$MonitoredLogFile")) {
# 	Get-Content "$LogFolder\WindowsUpdate.log" | Set-Content -Path "$MonitoredLogFile"
# }
# else {
# 	Copy-Item -Path "$LogFolder\WindowsUpdate.log" -Destination "$MonitoredLogFile"
# }

exit
