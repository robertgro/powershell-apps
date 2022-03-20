Write-Host
Write-Host "`nDisplaying entries in the Address Resolution Protocol (ARP) cache"
Write-Host "`ngetmac /v"
getmac /v
Write-Host "`narp -a"
arp -a
Write-Host "`nReturning info about IP and link-layer addresses for neighbor cache entries`n"
$cmd = "Get-NetNeighbor -AddressFamily IPv4 -State Unreachable, Stale, Reachable"
Write-Host $cmd
Invoke-Expression $cmd
Write-Host