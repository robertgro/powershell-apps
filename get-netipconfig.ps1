Write-Host
$cmd = "Get-NetIPConfiguration | Select-Object -Property InterfaceAlias, IPv4Address, @{n='NetAdapter.Status';e={`$_.NetAdapter.Status}}"
Write-Host $cmd
Invoke-Expression $cmd
Write-Host