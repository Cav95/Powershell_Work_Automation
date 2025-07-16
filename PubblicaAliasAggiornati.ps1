$from="C:\0_GitReposItory\Powershell_Work_Automation\AliasPowerShell\*"
$to="\\SRVUT\Transfert\MATTIA CAVINA\WindowsPowerShell\"
Copy-Item -Recurse $from $to
Remove-Item -Path "$to*" -Recurse -Force
setprofile