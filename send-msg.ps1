Write-Host
Write-Host "`nSend a Message`n" -ForegroundColor Cyan

if (!($target = Read-Host "Target PC [Default localhost]")) { $target = "localhost" }

if (!($msg = Read-Host "Message [Default test]")) { $msg = "test" }

if (!($time = Read-Host "Disappear Time in Seconds [Default none]")) { $time = [string]::Empty }

$cmd = "msg /server:$target *"

if ($time) {
    $cmd += " /Time:" + $time
}

$cmd += " " + "$msg"

Write-Host "`n$cmd`n"
Invoke-Expression $cmd
Write-Host