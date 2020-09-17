## This script generates DefenderATP.Log, useful to check whether DefenderATP is installed on the system or not.

Set-Variable -Name "LogFolder" -Value "$SplunkHome\var\log\windows_custom_powershell_scripts"
Set-Variable -Name "LogFile" -Value "$SplunkHome\var\log\windows_custom_powershell_scripts\DefenderATP.log"
Set-Variable -Name "ErrorFile" -Value "$SplunkHome\var\log\windows_custom_powershell_scripts\DefenderATPError.log"


if (!(Test-Path -Path $LogFolder )) {
	New-Item -ItemType directory -Path $LogFolder
}


# Checks if the registry value is present or not
function Test-RegistryValue {
    param (
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]$Path,
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]$Value
    )
    try {
        Get-ItemProperty -Path $Path -Name $Value -ErrorAction Stop | Out-Null
    return $true
    }
    catch {
        return $false
    }
}



if (Test-RegistryValue -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Advanced Threat Protection' -Value 'OnboardingInfo'){
    "The defender ATP is installed." | Out-File -encoding utf8 "$LogFile"
}
else{
    "The defender ATP is not installed." | Out-File -encoding utf8 "$LogFile"
}

exit
