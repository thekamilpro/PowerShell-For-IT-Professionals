Enable-Psremoting

Enter-PSSesion ps-svr1

Hostname
Get-Service
GIP

# I can even run commands that are not available on my source machine

Get-ADDomainController
Get-ADUser

Exit or Exit-PSSession

# Caution about double hoping

Invoke-Command

Invoke-Command -computerName ps-svr1 -command { get-service}

# Invoke command executes commands on the remote comptuers and brings back the results

# Can you tell a difference?

Invoke-Command -computerName ps-svr1 -command { get-service | Where {$_.status -eq 'stopped' } }

Invoke-Command -computerName ps-svr1 -command { get-service } | Where

# -ComputerName in the commandlet

Get-Service -ComputerName ps-svr1

Invoke-Command -computerName ps-svr1 -command { get-service }

# they look the same, but are they?

Get-Service -ComputerName ps-svr1 | GM

Invoke-Command -computerName ps-svr1 -command { get-service } | GM