Write-Host
$cmd = "Get-NetTCPConnection -State Established, Listen | Select-Object -Property LocalAddress, LocalPort, State, @{n='Process'; e={(Get-Process -Id `$_.OwningProcess).ProcessName}} | Sort-Object -Property State, LocalPort | Format-Table -AutoSize"
Write-Host $cmd
Invoke-Expression $cmd
Write-Host