################################
##Script to resolve malicious domain to localhost
################################
##########
##info@opensecure.co
##########
# Read the Alert that triggered the Active Response in manager and convert to Array
$INPUT_JSON = Read-Host
$INPUT_ARRAY = $INPUT_JSON | ConvertFrom-Json 
$INPUT_ARRAY = $INPUT_ARRAY | ConvertFrom-Json
$ErrorActionPreference = "SilentlyContinue"

#Extract Domain base_indicator.indicator
$malicious_domain = $INPUT_ARRAY."parameters"."alert"."data"."base_indicator"."indicator"

#Resolve Malicious Domain to Localhost
Add-Content -Path $env:windir\System32\drivers\etc\hosts -Value "`n127.0.0.1`t$malicious_domain" -Force
