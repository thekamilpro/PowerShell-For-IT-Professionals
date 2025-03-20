# Let's work on simple string
"Kamil Procyszyn"

"Kamil Procyszyn" | GM

$name = "Kamil Procyszyn"

$name| GM

# Same with numbers

3

3 | GM

3 + 5

$a = 3

$a | GM

$b = 5

$a + $b

# Let's check what will happen after changing the value of one of properties

$a = 10

$a + $b

# Let's use variables with parameters

$server = "PS-SVR1"

Test-NetConnection $server

Ping $server

Get-Process -ComputerName $server

# Variables give access to methods

$name

$name | GM

$name

$name.ToUpper()

$name.ToLower()

# We can store output of commands to variables and access their properties

$services = Get-Service

$services

$services.name

# We can obviously pipe

$services | where

# Storing multiple objects in variable

$computers = 'ps-svr1','localhost','1.1.1.1','8.8.8.8','kamilpro.com'

$computers

$computers[0]

$computers[2]

$computers[-1]

# Let's try to ping all of them

ping $computers

Test-NetConnection $computers

# If command doesn't allow to provide an array, we can loop through it

foreach ($c in $computers) {ping $c}

foreach ($c in $computers) {Test-NetConnection $c}

foreach ($c in $computers) {nslookup $c}