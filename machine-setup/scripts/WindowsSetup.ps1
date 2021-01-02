Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
Set-TaskbarSmall
Disable-GameBarTips
Disable-BingSearch

# the following line was erroring, idk why
# Set-BoxstarterTaskbarOptions -Size Small -Dock Top -Combine Always -AlwaysShowIconsOn -MultiMonitorOn -MultiMonitorMode All -MultiMonitorCombine Always


#--- Enable developer mode on the system ---
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1

#--- Windows Features ---
# Show hidden files, Show protected OS files, Show file extensions
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -EnableOpenFileExplorerToQuickAccess

# Make Registry backup
mkdir "C:\RegBack"
reg export HKCR C:\RegBack\HKCR.Reg /y
reg export HKCU C:\RegBack\HKCU.Reg /y
reg export HKLM C:\RegBack\HKLM.Reg /y
reg export HKU C:\RegBack\HKU.Reg /y
reg export HKCC C:\RegBackHKCC.Reg /y

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

Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value "0"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value "0"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "BorderWidth" -Value "0"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Clipboard" -Name "EnableClipboardHistory" -Value "1"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCortanaButton" -Value "0"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value "100"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "HungAppTimeout" -Value "1000"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "WaitToKillAppTimeout" -Value "1000"
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "WaitToKillServiceTimeout" -Value "1000"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" -Name "(Default)" -Value ""
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Value "0"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Value "1"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Value "1"
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "BingSearchEnabled" -Value 0  -PropertyType "DWORD"
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "CortanaConsent" -Value 0  -PropertyType "DWORD"

New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace" -Name "{645FF040-5081-101B-9F08-00AA002F954E}"

# Faster shutdown
New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "AutoEndTasks" -Value 1  -PropertyType "DWORD"

# Faster login after reboot
New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "Serialize"
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" -Name "StartupDelayInMSec" -Value ”0”  -PropertyType "DWORD"

# Show Recycle Bin in File Explorer
# New-ItemProperty -Path "HKLM:\SOFTWARE\Classes\WOW6432Node\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\ShellFolder" -Name "IsPinnedToNameSpaceTree" -Value ”1”  -PropertyType "DWORD"

$ErrorActionPreference = "SilentlyContinue"

# Remove "Edit with Paint 3D" from context menu
Remove-Item -Path "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.3mf\Shell\3D Edit" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.bmp\Shell\3D Edit" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.fbx\Shell\3D Edit" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.gif\Shell\3D Edit" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.jfif\Shell\3D Edit" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.jpe\Shell\3D Edit" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.jpeg\Shell\3D Edit" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.jpg\Shell\3D Edit" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.png\Shell\3D Edit" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.tif\Shell\3D Edit" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Classes\SystemFileAssociations\.tiff\Shell\3D Edit" -Recurse


# Hide "3D Objects" folder from "This PC"
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Recurse

# Documents
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" -Recurse

# Downloads
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" -Recurse

# Music
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" -Recurse

# Pictures
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -Recurse

# Videos
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -Recurse
Remove-Item -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" -Recurse

$ErrorActionPreference = "Continue"



# [HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR]
# "AppCaptureEnabled"=dword:00000000

# [HKCU:\System\GameConfigStore]
# "GameDVR_Enabled"=dword:00000000

# [HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR]
# "AllowGameDVR"=dword:00000000

# [HKCU:\System\GameConfigStore]
# "GameDVR_Enabled"=dword:00000000


# [HKCU:\Control Panel\Mouse]

# "MouseSensitivity"="10"
# "SmoothMouseXCurve"=hex:\
#     00,00,00,00,00,00,00,00,\
#     C0,CC,0C,00,00,00,00,00,\
#     80,99,19,00,00,00,00,00,\
#     40,66,26,00,00,00,00,00,\
#     00,33,33,00,00,00,00,00
# "SmoothMouseYCurve"=hex:\
#     00,00,00,00,00,00,00,00,\
#     00,00,38,00,00,00,00,00,\
#     00,00,70,00,00,00,00,00,\
#     00,00,A8,00,00,00,00,00,\
#     00,00,E0,00,00,00,00,00

# [HKEY_USERS\.DEFAULT\Control Panel\Mouse]

# "MouseSpeed"="0"
# "MouseThreshold1"="0"
# "MouseThreshold2"="0"

# New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace" -Name "{645FF040-5081-101B-9F08-00AA002F954E}"
# New-Item -Path "HKCU\USER\Control Panel\Desktop" -Name "AutoEndTasks"
# New-ItemProperty -Path "HKCU\USER\Control Panel\Desktop" -Name "AutoEndTasks" -Value ”1”  -PropertyType "DWORD"
# New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "Serialize"
# New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" -Name "StartupDelayInMSec" -Value ”0”  -PropertyType "DWORD"
# New-ItemProperty -Path "HKLM:\SOFTWARE\Classes\WOW6432Node\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\ShellFolder" -Name "IsPinnedToNameSpaceTree" -Value ”1”  -PropertyType "DWORD"
