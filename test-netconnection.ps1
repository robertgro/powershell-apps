Write-Host
$cmd = "Test-NetConnection"

$options = [System.Management.Automation.Host.ChoiceDescription[]] @("&Yes", "&No", "&Quit")

$opt = $host.UI.PromptForChoice("Details","Do you wish to provide args?", $Options, 2)
switch($opt)
{
    0 { 
        Write-Host "`nTest-NetConnection Details`n" -ForegroundColor Cyan
        
        if (!($target = Read-Host "Target PC [Default None]")) { $target = [string]::Empty }
        if (!($port = Read-Host "Port [Default None]")) { $port = [string]::Empty }
        if (!($infolvl = Read-Host "InfoLevel [Detailed] [Quiet] [Default None]")) { $infolvl = [string]::Empty }
        if (!($troute = Read-Host "Trace Route [Y] [Default None]")) { $troute = [string]::Empty }

        if ($target) {
            $cmd += " -ComputerName " + $target 
        }

        if ($port) {
            $cmd += " -Port " + $port
        }

        if ($infolvl) {
            $cmd += " -InformationLevel " + $infolvl
        }

        if ($troute) {
            $cmd += " -TraceRoute"
        }

        Write-Host "`n$cmd`n"
        Invoke-Expression $cmd
        Write-Host
    }
    1 { 
        Write-Host "`nInvoking net connection test with default values" -ForegroundColor Green
        Write-Host $cmd
        Invoke-Expression $cmd
        Write-Host
    }
    2 {
        Write-Host "`nExiting, no operation performed." -ForegroundColor Yellow
        Write-Host
        Exit
    }
}

Write-Host