# Dev Tools
choco upgrade -y nvm
nvm install latest
nvm use latest
choco upgrade -y visualstudio2017buildtools
choco upgrade -y visualstudio2017-workload-vctools
choco upgrade -y python2 # Node.js requires Python 2 to build native modules
choco upgrade -y python
choco upgrade -y chocolatey
choco upgrade -y chocolateygui
choco upgrade -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco upgrade -y git-credential-manager-for-windows
choco upgrade -y github-desktop
choco upgrade -y jetbrainstoolbox
choco upgrade -y firacode
choco upgrade -y azure-cli
choco upgrade -y gcloudsdk
choco upgrade -y microsoft-windows-terminal
choco upgrade -y postman
choco upgrade -y jetbrainstoolbox

Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force
Install-Script Install-VSCode -Scope CurrentUser; Install-VSCode.ps1
RefreshEnv
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.debugger-for-edge
code --install-extension ms-vscode.powershell
code --install-extension ms-azuretools.vscode-docker


# Programs
choco upgrade -y powertoys
choco upgrade -y googlechrome
choco upgrade -y googledrive
choco upgrade -y google-drive-add-to-explorer
choco upgrade -y firefox
choco upgrade -y 7zip.install
choco upgrade -y autoruns
choco upgrade -y vlc
choco upgrade -y k-litecodecpackfull
choco upgrade -y windirstat
choco upgrade -y discord
choco upgrade -y steam
choco upgrade -y lastpass
choco upgrade -y cpu-z.install

# WSL
choco upgrade -y Microsoft-Windows-Subsystem-Linux --source="'windowsfeatures'"
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu.appx -UseBasicParsing
Add-AppxPackage -Path ~/Ubuntu.appx
# run the distro once and have it install locally with root user, unset password
RefreshEnv
Ubuntu1804 install --root
Ubuntu1804 run apt update
Ubuntu1804 run apt upgrade -y
