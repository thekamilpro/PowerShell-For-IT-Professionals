# Slides
# Allows to retrieve and manage information of Windows
# Is Microsoft's implementation of Web-Based Enterprise Management (WBEM) and Common Information Model (CIM)
# Since Windows 2000
# Organised in namespaces e.g. Root\CIMv2 contains all information about Windows and hardware and than classes
# It's bit obscure

# Let's look at an example
Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_BIOS

# WMI Explorer to rescue - https://github.com/vinaypamnani/wmie2/releases

# Let's browse a bit here

Get-CimClass -Namespace root/CIMV2 -ClassName Win32_OperatingSystem

Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_OperatingSystem

Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_OperatingSystem| FL *

#Let's call a method
Get-CimClass -Namespace root/CIMV2 -ClassName Win32_OperatingSystem

Invoke-CimMethod -ClassName Win32_OperatingSystem -MethodName reboot

Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_Service

Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntiVirusProduct

# Filters and GPO

Get-CimInstance -Filter 'Version like "10.%" and ProductType="2"' -ClassName Win32_OperatingSystem

select * from Win32_OperatingSystem where Version like "10.%" and ProductType="3"


# CIM VS WMI

Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntiVirusProduct
Get-WmiObject -Namespace root/SecurityCenter2 -Class AntiVirusProduct

