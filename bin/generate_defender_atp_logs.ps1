## This script generates DefenderATP.Log, useful to check whether DefenderATP is installed on the system or not.

Set-Variable -Name "LogFolder" -Value "$SplunkHome\var\log\windows_custom_powershell_scripts"
Set-Variable -Name "LogFile" -Value "$SplunkHome\var\log\windows_custom_powershell_scripts\DefenderATP.log"


if (!(Test-Path -Path $LogFolder )) {
	New-Item -ItemType directory -Path $LogFolder
}


# Checks if the registry value is present or not
function Get-RegistryValue {
    param (
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]$Path,
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]$Value
    )
    try {
		$Return = Get-ItemProperty -Path $Path | Select-Object -ExpandProperty $Value -ErrorAction Stop
    	return $Return
    }
    catch {
        return "NotFound"
    }
}


if (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows Advanced Threat Protection\Status'){
    $OnboardingState = Get-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows Advanced Threat Protection\Status" -Value OnboardingState
	
	$LastConnected = Get-RegistryValue -Path "HKLM:\SOFTWARE\Microsoft\Windows Advanced Threat Protection\Status" -Value LastConnected
	$LastConnected = [DateTime]::FromFiletimeUtc([Int64]::Parse($LastConnected))

	"The defender ATP is installed. OnboardingState=" + $OnboardingState + ", LastConnected=" + $LastConnected + " UTC" | Out-File -encoding utf8 "$LogFile"
}
else{
    "The defender ATP is not installed." | Out-File -encoding utf8 "$LogFile"
}

exit
