# list available distros
```
wsl --list
```

# list currently running distros
```
wsl --list --running
```

# list all WSL distros with versions
```
wsl --list --all --verbose
```

# set default distribution; distro that runs when running `wsl`
```
wsl --setdefault <DistributionName>
```

# run a specific distribution
```
wsl --distribution <DistributionName>
```

# enable Virtual Machine Platform (for WSL 2)
```
dism /online /enable-feature /all /norestart /featurename:VirtualMachinePlatform
```

# enable Hyper-V
# to fix "Please enable the Virtual Machine Platform Windows feature and ensure
# virtualization is enabled in the BIOS."
```
dism /online /enable-feature /all /norestart /featurename:Microsoft-Hyper-V
bcdedit /set hypervisorlaunchtype auto
```

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

# disable Hyper-V
```
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor
bcdedit /set hypervisorlaunchtype off
```

```
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor
```

# set WSL 2 as default version
```
wsl --set-default-version 2
```

# set WSL version of a specific distribution
```
wsl --set-version <DistributionName> <VersionNumber>

wsl --set-version Ubuntu-20.04 1
wsl --set-version Ubuntu-20.04 2
```
