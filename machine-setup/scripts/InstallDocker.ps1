choco install -y Microsoft-Hyper-V-All --source="'windowsFeatures'"

Enable-WindowsOptionalFeature -Online -FeatureName containers -All
RefreshEnv
choco install docker-desktop
