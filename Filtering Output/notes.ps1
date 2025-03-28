### Filtering
# Some commands accept wild cards in the search or have a filter parameter
Get-Service -Name w*,b*

#But there's more universal method, based on property names
Get-Service | Where-Object -Filter

#So let's break it down
#Where-Object allows to filter out the incoming object based on the comparation operator
#Most popular operators are:

-eq - Equals
-ne - Not equals
-gt - Greather than
-lt - Less then
-le - Less than or equal
-ge - Greater than or equal
-Like
-Not like

#There are more many, you can check these help topics:
Help about_Operators
Help about_Comparison_Operators

#$_ is current object; it's what we're piping in our case Get-Service
# .Status that follows $_ indicates we're passing only specific property of the Get-Service object, in this case Status
Get-Service | GM

#Let's talk this through this example once again
Get-Service | Where-Object -Filter

#We can use an alias Where instead of Where-Object
Get-Service | Where

#I can also link multiple comparissions together with -and -or
Get-Service | Where

### What if I'd like to choose only specific properties
Get-Service | Select-Object -Property DisplayName,Status

# I can use alias Select instead
Get-Service | Select DisplayName,Status

# Also allows to access hidden by default properties
# Let's find out the path of the program where it's running from, and when was it lunched

Get-Process | Select *

Get-Path | Select Name, Path, StartTime

### Always filter left