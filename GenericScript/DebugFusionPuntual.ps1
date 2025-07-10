$data = Get-Date -Format "yyyyMMdd_mmHH"
$username = $env:USERNAME

Write-Output Data corrente: %data%
Copy-Item "C:\Fusion DeBug\DeBuG.txt" "\\SRVUT\ut\Documenti Vari UT\Documenti PDM Fusion\DebugMonitoring\${username}_${data}_Debug.txt"

