mkdir $PROFILE
Set-Location $PROFILE
Set-Location ../
Remove-Item ./*.ps1
Copy-Item "\\SRVUT\Transfert\MATTIA CAVINA\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" $PROFILE
#Set-ExecutionPolicy Unrestricted -> to use befor installation in PowerShell amministrator