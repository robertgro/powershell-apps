Write-Host
$cmd = "Test-Connection"

Write-Host "`nTest-Connection Details`n" -ForegroundColor Cyan

if (!($target = Read-Host "Target PC [Default 127.0.0.1]")) { $target = "127.0.0.1" }
if (!($count = Read-Host "Count [Default 1]")) { $count = 1 }
if (!($quiet = Read-Host "Quiet Mode [Default None][Enter arbitrary char to activate]")) { $quiet = $false }

if ($target) {
    $cmd += " -ComputerName " + $target 
}

if ($count) {
    $cmd += " -Count " + $count
}

if ($quiet) {
    $cmd += " -Quiet"
}

Write-Host "`n$cmd`n"
if (Invoke-Expression $cmd) {
    Write-Host "$target reachable"
}
else {
    Write-Host "$target unreachable"
}
Write-Host