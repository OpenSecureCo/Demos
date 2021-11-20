:: Simple script to run AlienVault OTX PShell script.
:: The script executes a powershell script and appends output.
@ECHO OFF
ECHO.

"C:\Program Files\PowerShell\7\"pwsh.exe -executionpolicy ByPass -File "C:\Windows\PowerShell7\malicious_domain.ps1"

:Exit
