Write-Host
Write-Host "`nNSlookup" -ForegroundColor Cyan
#Resolve-DnsName currently working with hostnames only, dropping back to nslookup

[System.Net.DNS]::GetHostEntry('google.de')

$inputchoice = [string]::Empty
$regex = "(^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$)|(^([A-z]{1,}\.)?[A-z]{2,}\.[A-z]{2,9}$)"

do {
    $inputchoice = Read-Host "`nEnter a hostname or ip ('q' for exit)"
    if ($inputchoice -notmatch $regex -and $inputchoice -notin 'q') {
        Write-Host "`n'$inputchoice' is no valid ip or hostname" -ForegroundColor Red
    } elseif ($inputchoice -notin 'q') {
        $cmd = "nslookup $inputchoice"
        Write-Host "`n$cmd`n"
        Invoke-Expression $cmd
    }
}
until ($inputchoice -eq 'q')

Write-Host "Bye`n"
Write-Host