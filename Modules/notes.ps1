Get-Command

Get-Command | Measure-Object

Get-Module -ListAvailable | Measure

#### About special shell
There's only one PowerShell.
Let's review AD module for PowerShell.


#### SNMP
Let's use PS Gallery

Use SNMP module
Get-Command -Module SNMP

Invoke-SnmpWalk -IP 10.0.0.71 -Community public -OID ".1.3.6.1.2.1.1"

### VMWARE
Find-Module vmware*

#Install
Install-Module vmware.powercli

Get-command -Module vmware.powercli

Connect-ViServer

Get-VM

New-VM VM2

Get-VM VM2

Remove-VM VM2

