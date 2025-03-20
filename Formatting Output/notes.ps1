# So far, we've been using default PowerShell behaviour for formatting output
# Although in the last lesson we did filtering data with Where-Object and Select-Object
# We didn't really focus on how data is presented on the screen. Let's see what can be done here.

# Let's have a look at local
Get-LocalGroup

Get-LocalGroup | Format-List

#Alias is FL
#Like with Select-Object, we can specify properties we're after
Get-LocalGroup | fl -Property name,sid

#Another example when List might be easier to read then table
Get-CimInstance win32_ComputerSystem

## Format Table

#ipconfig...
Get-NetIPConfiguration OR GIP

Get-NetIPConfiguration | FT

GIP | FT -Wrap

GIP | -Properties *

GIP | FT -Autosize


### Grouping

Get-Service | Format-Table -GroupBy Status

Get-Service | Sort-Object Status

Get-Service | Sort-Object Status | Format-Table -GroupBy Status

### What if I want to show all properties, but they don't fit on screen
GIP | FL *

# Or we can display to GUI
gip | Select-Object * | Out-GridView

### Speaking of Out...
by default, PowerShell adds Out-Host to every command you run, so that it displays on the screen

But we can Out- to some other places
Get-Command Out-*

Get-Service | Sort-Object Status | Format-Table -GroupBy Status | Out-File c:\temp\services

Get-Service | Sort-Object Status | ConvertTo-Html | Out-File c:\temp\services.html