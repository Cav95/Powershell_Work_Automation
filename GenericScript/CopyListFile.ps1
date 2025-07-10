param (
[string]$sourceFile,
[string]$destNamesFile
)

# Mostra gli argomenti
Write-Output "$sourceFile $destNamesFile"

# Controlla se entrambi gli argomenti sono stati forniti
if ([string]::IsNullOrEmpty($sourceFile) -or [string]::IsNullOrEmpty($destNamesFile)) {
Write-Output "mancano argomenti"
exit 1
}

# Controlla se il file sorgente esiste
if (!(Test-Path $sourceFile)) {
Write-Output "manca file da copiare"
exit 1
}

# Controlla se il file contenente i nomi esiste
if (!(Test-Path $destNamesFile)) {
Write-Output "manca file con elenco nomi destinazione"
exit 1
}

# Leggi ogni nome e copia il file
Get-Content $destNamesFile | ForEach-Object {
$name = $_.Trim("`r") # Rimuove eventuali carriage return
Copy-Item -Path $sourceFile -Destination "$name.txt"
}
