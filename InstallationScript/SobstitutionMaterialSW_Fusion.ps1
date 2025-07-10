#Percorso file C:\Users\mcavina\AppData\Local\RuleDesigner\Fusion\Settings\
#Percorso del file
$userpath = $env:LOCALAPPDATA
$path = "RuleDesigner\Fusion\Settings"
$name = "CadSettings.xml"
$filePath = "$userpath\$path\$name"


# Leggi il contenuto del file
$content = Get-Content $filePath

# Sostituisci la stringa
$newContent = $content -replace "<SolidWorks_MaterialTableName>solidworks material.sldmat</SolidWorks_MaterialTableName>", "<SolidWorks_MaterialTableName>Cepi Materiali.sldmat</SolidWorks_MaterialTableName>"

# Sovrascrivi il file con il nuovo contenuto
$newContent | Set-Content $filePath
