$OS = Get-CimInstance -ClassName Win32_OperatingSystem
# OS Name
Write-Host "OS Name: $($OS.Caption)"
# Version
Write-Host "OS Version: $($OS.Version)"
# Install Date
Write-Host "OS Install date: $($OS.InstallDate)"
# Client/Server
IF ($os.Caption -like "*Server*") { $server = $true } else { $server = $false}
# IP: Interface, ip, gateway, dns
# Network: Can I ping gateway, DNS Server, website
# Installed roles – server only
# Last updates
# It would be nice if could run this remotely

$props = [pscustomobject]@{
'OSName' = $OS.Caption
'OSVersion' = $OS.Version
'OSInstallDate' = $OS.InstallDate
'isServer' = $Server
}
$props