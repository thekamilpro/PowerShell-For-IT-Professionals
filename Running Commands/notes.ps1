#We'll do some work on services now, let's see what commands are available
help *service

#Lets retrieve all services
Get-Service

#I'm more interested in bits and wuasvc
Get-Service -name wuauserv,bits

#I can take a shortcut of parameter as long as
Get-Service -n wuauserv,bits

#But as we know from help, name is positional parameter thus I can run same command as...
Get-Service wuauserv,bits

#Let's stop services
Stop-Service wuauserv,bits
Get-Service wuauserv,bits

#And start services
Start-Service wuauserv,bits
Get-Service wuauserv,bits

#In exercises I've asked to retrieve event logs
Get-EventLog -LogName Application -Newest 10 -EntryType Error

## Naming convention
# Verb-Noun. You can retrieve all "approved" verbs by
Get-Verb

## There's also a naming convention for nouns.
# Nouns from the same module usually start with the same "Prefix" e.g. Active Directory cmdlets start with AD

## As it's shell you can call other familiar programs, e.g. ping, nslookup etc
ping 8.8.8.8
nslookup bbc.com

## Some errors
GetService
Get Service
Gt-Service