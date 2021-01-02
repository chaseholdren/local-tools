# WSL
choco install -y Microsoft-Windows-Subsystem-Linux --source="'windowsfeatures'"
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu.appx -UseBasicParsing
Add-AppxPackage -Path ~/Ubuntu.appx
# run the distro once and have it install locally with root user, unset password
RefreshEnv
Ubuntu1804 install --root
Ubuntu1804 run apt update
Ubuntu1804 run apt upgrade -y

# Dev Tools
choco install chocolatey
choco install jetbrainstoolbox
choco install firacode
choco install azure-cli
choco install gcloudsdk
choco install microsoft-windows-terminal
choco install -y vscode
choco install -y vscode-powershell
choco install -y vscode-docker
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.debugger-for-edge
choco install github-desktop
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco install git-credential-manager-for-windows
choco install postman
choco install jetbrainstoolbox


# Programs
choco install powertoys
choco install -y googlechrome
choco install googledrive
choco install google-drive-add-to-explorer
choco install -y firefox
choco install -y 7zip.install
choco install -y autoruns
choco install vlc
choco install k-litecodecpackfull
choco install windirstat
choco install discord
choco install steam
choco install lastpass
choco install cpu-z.install

#--- Tools ---
choco install nvm
nvm install latest
nvm use latest
choco install -y visualstudio2017buildtools
choco install -y visualstudio2017-workload-vctools
choco install -y python2 # Node.js requires Python 2 to build native modules
choco install -y python
