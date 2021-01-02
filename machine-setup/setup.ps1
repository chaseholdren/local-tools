Disable-UAC
$ConfirmPreference = "None" #ensure installing powershell modules don't prompt on needed dependencies

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}


write-host "meep0"
executeScript "WindowsSetup.ps1";
write-host "meep"
executeScript "RemoveDefaultApps.ps1";
# executeScript "InstallWSL.ps1";
# executeScript "InstallPackages.ps1";

# choco install -y Microsoft-Hyper-V-All --source="'windowsFeatures'"

# Enable-WindowsOptionalFeature -Online -FeatureName containers -All
# RefreshEnv
# choco install docker-desktop

choco install -y postman

# checkout recent projects
# mkdir C:\github
# cd C:\github
# git.exe clone https://github.com/microsoft/windows-dev-box-setup-scripts

# # set desktop wallpaper
# Invoke-WebRequest -Uri 'http://chocolateyfest.com/wp-content/uploads/2018/05/img-bg-front-page-header-NO_logo-opt.jpg' -Method Get -ContentType image/jpeg -OutFile 'C:\github\chocofest.jpg'
# Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value 'C:\github\chocofest.jpg'
# rundll32.exe user32.dll, UpdatePerUserSystemParameters
# RefreshEnv

Disable-BingSearch
Enable-UAC
