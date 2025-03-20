# Connects multiple commands into one
# Output from former command is sent to latter

#Some examples we've been using so far

Get-Service
get-service wuauserv,bits | Stop-Service
Get-Service

get-service wuauserv,bits |Start-Service
Get-Service

notepad
get-process -name notepad | Stop-Process

Get-EventLog -LogName Application -Newest 10 -EntryType Error | Export-Csv -Path .\eventlogs.csv
.\eventlogs.csv

# You might have noticed there's more information in CSV than in the output screen, that's by design.
# Outputting to shell often has special formatting to limit the amount of output due to better readability

Get-Service
Get-Service | FT *
#FT is an alias for Format-Table. We will talk about aliases and formatting output later on in the course, however when convenient I'll let you know the alias know

# Why pipeline works? It's because it's an object
# We have properties and methods
Get-Service
Get-Service | GM #GM Stands for Get-Member

# Show that both commands use the same service type
Help Get-Service -full
Help Stop-Service -full

# Pipeline is not only limited to matching by type, it will try match property names, types etc.

#Reading files
Get-Content .\eventlogs.csv
Import-Csv .\eventlogs.csv