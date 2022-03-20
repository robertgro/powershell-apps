Write-Host
$cmd = "Get-CimInstance -ClassName Win32_BIOS"
Write-Host "`n$cmd"
Invoke-Expression $cmd
$cmd = "Get-CimInstance -ClassName Win32_Baseboard"
Write-Host "`n$cmd`n"
Invoke-Expression $cmd
$cmd = "Get-CimInstance -ClassName Win32_ComputerSystem"
Write-Host "`n$cmd`n"
Invoke-Expression $cmd
$cmd = "Get-CimInstance -ClassName Win32_OperatingSystem"
Write-Host "`n$cmd`n"
Invoke-Expression $cmd
$cmd = "Get-CimInstance -ClassName Win32_Processor | Select-Object -ExcludeProperty 'CIM*'"
Write-Host "`n$cmd`n"
Invoke-Expression $cmd
$cmd = "Get-CimInstance -ClassName Win32_LogicalDisk | Format-Table"
Write-Host "`n$cmd`n"
Invoke-Expression $cmd
$cmd = "Get-CimInstance -ClassName Win32_PhysicalMemory | Format-Table"
Write-Host "`n$cmd`n"
Invoke-Expression $cmd
$cmd = "Get-CimInstance -ClassName Win32_Environment | Format-Table"
Write-Host "`n$cmd`n"
Invoke-Expression $cmd
$cmd = "Get-CimInstance -ClassName Win32_UserAccount | Format-Table"
Write-Host "`n$cmd`n"
Invoke-Expression $cmd
$cmd = "Get-CimInstance -ClassName Win32_Share | Format-Table"
Write-Host "`n$cmd`n"
Invoke-Expression $cmd
Write-Host