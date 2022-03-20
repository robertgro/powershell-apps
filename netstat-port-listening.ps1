Write-Host
Write-Host "`nNetstat" -ForegroundColor Cyan

$inputchoice = [string]::Empty
$regex = "^[0-9]{1,5}$"

do {
    $inputchoice = Read-Host "`nEnter a port ('q' for exit)"
    if ($inputchoice -notmatch $regex -and $inputchoice -notin 'q') {
        Write-Host "`n'$inputchoice' is no valid port number" -ForegroundColor Red
    } elseif ($inputchoice -notin 'q') {
        $cmd = "netstat -na | Select-String '$inputchoice'"
        Write-Host "`n$cmd`n"
        Invoke-Expression $cmd
    }
}
until ($inputchoice -eq 'q')

Write-Host "Bye`n"
Write-Host