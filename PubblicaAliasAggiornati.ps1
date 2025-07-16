$from="C:\0_GitReposItory\Powershell_Work_Automation\AliasPowerShell\*"
$to="\\SRVUT\Transfert\MATTIA CAVINA\WindowsPowerShell\"
Remove-Item -Path "$to*" -Recurse -Force
Copy-Item -Recurse $from $to
set-profile