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
$Network = Get-NetAdapter | Where-Object | Get-NetIPConfiguration
# Last updates
$Updates = Get-HotFix | Sort InstalledOn -Descending | Select-Object -First 5
# It would be nice if could run this remotely

$props = [pscustomobject]@{
'OSName' = $OS.Caption
'OSVersion' = $OS.Version
'OSInstallDate' = $OS.InstallDate
'isServer' = $Server
'IPv4Address' = $Network.IPv4Address.IPAddress
'Gateway' = $Network.IPv4DefaultGateway.nexthop
'DNS' = $Network.DNSServer | Where-Object | Select-Object ServerADdresses -ExpandProperty ServerAddresses
'Updates' = $Updates.HotfixID | Out-String
}
# Network: Can I ping gateway, DNS Server, website
$pingGateway = Test-NetConnection -ComputerName $props.Gateway -InformationLevel Quiet
$pingDNS = Test-NetConnection -ComputerName $props.DNS[0] -InformationLevel Quiet
$pingWebsite = Test-NetConnection -ComputerName 'kamilpro.com' -InformationLevel Quiet

$props | Add-Member -MemberType NoteProperty -Value $pingGateway -Name 'pingGateway'
$props | Add-Member -MemberType NoteProperty -Value $pingDNS -Name 'pingDNS'
$props | Add-Member -MemberType NoteProperty -Value $pingWebsite -Name 'pingWebsite'
# Installed roles – server only

IF ($props.isServer = $true) { $Roles = Get-WindowsFeature }

$props