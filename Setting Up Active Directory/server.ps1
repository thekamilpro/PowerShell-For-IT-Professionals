### Server

# Check IP configuration
# Show steps in Server how to install

# Check hostname
Hostname

# Rename server
Rename-Computer ps-svr1

# Restart computer
Reboot-computer

# Get-WindowsFeature

# Install-WindowsFeature
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

Install-ADDSForest -DomainName posh.pri

