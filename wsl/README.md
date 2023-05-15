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
#
# https://forums.docker.com/t/cant-start-container-required-feature-not-installed/133977/8
```
dism /online /enable-feature /all /norestart /featurename:Microsoft-Hyper-V
bcdedit /set hypervisorlaunchtype auto
```

```
Enable-WindowsOptionalFeature -Online -FeatureName containers –All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
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

# vagrant
add to bashrc
```
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"' >> ~/.bashrc
export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox
```

fix ` default: Warning: Connection refused. Retrying...`: install vagrant plugin
```
vagrant plugin install virtualbox_WSL2
```
