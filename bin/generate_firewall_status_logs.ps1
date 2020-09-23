## This script generates FirewallStatus.Log, useful to check the Firewall status. 

Set-Variable -Name "LogFolder" -Value "$SplunkHome\var\log\windows_custom_powershell_scripts"
Set-Variable -Name "LogFile" -Value "$SplunkHome\var\log\windows_custom_powershell_scripts\FirewallStatus.log"

if (!(Test-Path -Path $LogFolder )) {
    New-Item -ItemType directory -Path $LogFolder
}

NetSh Advfirewall show allprofiles state | Out-File -encoding utf8 "$LogFile"

exit
