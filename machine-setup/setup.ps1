Disable-UAC
$ConfirmPreference = "None" #ensure installing powershell modules don't prompt on needed dependencies

Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
Set-TaskbarSmall
Disable-GameBarTips

write-host "hi0"
Set-BoxstarterTaskbarOptions -Size Small -Dock Top -Combine Always -AlwaysShowIconsOn -MultiMonitorOn -MultiMonitorMode All -MultiMonitorCombine Always
write-host "hi"

#--- Enable developer mode on the system ---
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1

write-host "hi2"

#--- Windows Features ---
# Show hidden files, Show protected OS files, Show file extensions
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -EnableOpenFileExplorerToQuickAccess

write-host "hi3"

# Make Registry backup
mkdir "C:\RegBack"
reg export HKCR C:\RegBack\HKCR.Reg /y
reg export HKCU C:\RegBack\HKCU.Reg /y
reg export HKLM C:\RegBack\HKLM.Reg /y
reg export HKU C:\RegBack\HKU.Reg /y
reg export HKCC C:\RegBackHKCC.Reg /y

write-host "hi4"

# https://blog.netwrix.com/2018/09/11/how-to-get-edit-create-and-delete-registry-keys-with-powershell/

#--- File Explorer Settings ---
# will expand explorer to the actual folder you"re in
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
#adds things back in your left pane like recycle bin
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
#opens PC to This PC, not quick access
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
#taskbar where window is open for multi-monitor
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

# Turn off system sounds
# https://superuser.com/a/1397681
Set-ItemProperty -Path "HKCU:\AppEvents\Schemes" -Name "(Default)" -Value ".None"
Get-ChildItem -Path "HKCU:\AppEvents\Schemes\Apps" | Get-ChildItem | Get-ChildItem | Where-Object {$_.PSChildName -eq ".Current"} | Set-ItemProperty -Name "(Default)" -Value ""

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
