Set-Location C:\temp2; clear
$PSVersionTable
### Invoke-WebRequest
# Downloading files
$uri = "https://github.com/notepad-plus-plus/notepad-plus-plus/relea..."
$here = Get-Location

Invoke-WebRequest -Uri $uri
Invoke-WebRequest -Uri $uri -OutFile .\notepad1.exe
ls

$wc = [System.Net.Webclient]::New()
$wc.DownloadFile($uri, "$here\notepad2.exe")
ls

Start-BitsTransfer -Source $uri -Destination "$here\notepad3.exe"
ls

$Website = Invoke-WebRequest -Uri "bbc.com"
$Website
$Website.StatusCode; $Website.StatusDescription; $Website.Headers
$Website.RawContent
$Website.RawContent | Out-File website.html
explorer .
# Websites
$Website.Links
$Website.Links | where
$Website.Links | where | select data-bbc-title, href

# Resolving shortcut urls
$Website.Images
$Website.images | where
$Website.images | where | ForEach-Object { Start-BitsTransfer -Source $_.src -Destination "$($_.alt).jpg" }
ls
explorer .

# Short urls
$uri = "https://bit.ly/38JsRDB"
$response = Invoke-WebRequest -Uri $uri
$response.BaseResponse.RequestMessage.RequestUri.AbsoluteUri

# Api
$Uri = "https://pwpush.com/p.json"

# Json
$json = '{
"password": {
"expire_after_views": 5,
"expire_after_days": 2,
"payload": "mysecretpassword"
}
}'

$request = Invoke-WebRequest -Uri $uri -Method "Post" -ContentType "application/json" -Body $json
$request
$request.Content
$request.Content | ConvertFrom-Json

$body = @{
    password = @{
        "payload"            = "mysecretpassword"
        "expire_after_days"  = 2
        "expire_after_views" = 5
    }
}
$body
$body.password
$Body | ConvertTo-Json
$Body

$body = @{
    password = @{
        "payload"            = "mysecretpassword"
        "expire_after_days"  = 2
        "expire_after_views" = 5
    }
} | ConvertTo-Json

Invoke-WebRequest -Uri $uri -Method "Post" -ContentType "application/json" -Body $body

###Invoke-RestMethod

$Uri = "https://pwpush.com/p.json"

$params = @{
    uri         = $uri
    ContentType = "application/json"
    Method      = "Post"
    body        = $body
}
$password = Invoke-RestMethod @params
$password

# Let's confirm it worked
$uri = "https://pwpush.com/p/{0}.json" -f $password.url_token
Invoke-RestMethod -Uri $uri