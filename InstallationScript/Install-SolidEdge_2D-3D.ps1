Set-Location "C:\Program Files\Siemens\Solid Edge 2019\Preferences"

# Cancella i file specificati
Remove-Item -Path ".\SELicense.dat" -ErrorAction SilentlyContinue
# Usa -ErrorAction SilentlyContinue per evitare errori se i file non esistono
Remove-Item -Path ".\1-SELicense.dat" -ErrorAction SilentlyContinue

# Copia i file dalla condivisione di rete
$SourcePath = "\\SRVUT\Transfert\MATTIA CAVINA\Viewer_SolidEdge"
$DestinationPath = "C:\Program Files\Siemens\Solid Edge 2019\Preferences"

Copy-Item -Path (Join-Path $SourcePath "SELicense.dat") -Destination $DestinationPath -Force
Copy-Item -Path (Join-Path $SourcePath "1-SELicense.dat") -Destination $DestinationPath -Force