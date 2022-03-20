Write-Host
$cmd = "Get-DnsClientCache"
Write-Host $cmd
Invoke-Expression $cmd

$options = [System.Management.Automation.Host.ChoiceDescription[]] @("&Yes", "&No", "&Quit")

$opt = $host.UI.PromptForChoice("Clear DNS Cache","Do you wish to proceed?", $Options, 2)
switch($opt)
{
    0 { 
        Write-Host "`nClearing dns cache now...`n" -ForegroundColor Cyan
        $cmd = "Clear-DnsClientCache"
        Write-Host $cmd
        Invoke-Expression $cmd
    }
    1 { 
        Write-Host "`nLeaving dns cache as it is" -ForegroundColor Green
    }
    2 {
        Write-Host "`nExiting, leaving dns cache untouched" -ForegroundColor Yellow
        Exit
    }
}
Write-Host