#Da lanciare da powershell nella cartella di stampe che si vuole processare , la cartella deve essere quella
#proveniente da fusion.

#mi salvo la mia locazione attuale per esteso
$mypath = Get-Location
#Prendo il nome della directory che voglio spostare
$mylocation = Split-Path -Leaf (Get-Location)
#Salvo i primi 4 caratteri
$NumCommessa = $mylocation.Substring(0, 4)
#Salvo la cartella di destinazione
#test#$destination="C:\Users\mcavina\OneDrive - CEPI s.p.a\Desktop\prova"
$destination = "\\SRVUT\Transfert\Stampe UT"
#giorno di esecuzione
$date = (Get-Date).ToString("yyyyMMdd")
#salvo lo username
$myname = $env:USERNAME

#cerco la directory per lo schema
if ($NumCommessa -lt 3000) {
    $orderFolder = "0_2999"
}
elseif ($NumCommessa -lt 3200) {
    $orderFolder = "3000_3199"
}
elseif ($NumCommessa -lt 3400) {
    $orderFolder = "3200_3399"
}
elseif ($NumCommessa -lt 3600) {
    $orderFolder = "3400_3599"
}
elseif ($NumCommessa -lt 3800) {
    $orderFolder = "3600_3799"
}
elseif ($NumCommessa -lt 4000) {
    $orderFolder = "3800_3999"
}
elseif ($NumCommessa -lt 4200) {
    $orderFolder = "4000_4199"
}
elseif ($NumCommessa -lt 4400) {
    $orderFolder = "4200_4399"
}
elseif ($NumCommessa -lt 4500) {
    $orderFolder = "4400-4499"
}
elseif ($NumCommessa -lt 4600) {
    $orderFolder = "4500-4599"
}
elseif ($NumCommessa -lt 4700) {
    $orderFolder = "4600-4699"
}
elseif ($NumCommessa -lt 4800) {
    $orderFolder = "4700-4799"
}
elseif ($NumCommessa -lt 4900) {
    $orderFolder = "4800-4899"
}
else {
    $orderFolder = "4900-4999"
}

#accedo e salvo la posizione della cartella commessa
Set-Location "\\srvut\Commesse\$orderFolder\$NumCommessa*"
$p = Get-Location

#torna alla cartella originale
Set-Location "$mypath"

#Per ogni sotocartella eseguo delle azioni
Get-ChildItem -Directory | ForEach-Object {
    $name = $_.Name

    #remove Codici.csv
    Remove-Item "$mypath\$name\Codici.csv"

    #Copio lo schema in tutte
    Copy-Item -Path "$p\*h*$NumCommessa*.dwg" -Destination "$mypath\$name\"

    #Copio l'ordine stampe in tutte
    Copy-Item -Path "T:\MacroUT\Ordinare stampe.xlsx" -Destination "$mypath\$name\"

    #Se la cartella è officina ci metto il foglio dell officina
    if ($name.Contains("Officina")) {
        Copy-Item -Path "\\srvut\ut\FogliElettronici-Modelli\Stampe Officina.xlsx" -Destination "$mypath\$name\"
    }

    #Se montatori copio anche la pianta
    if ($name.Contains("Montatori")) {
        Copy-Item -Path "$p\*t*$NumCommessa*.dwg" -Destination "$mypath\$name\"
    }
}

#Copio tutta la mia cartella nella nuova posizione
Set-Location ..
Copy-Item -Recurse ".\$mylocation" "$destination\$mylocation($myname)_$date"

$deleteme = ""

while ($deleteme -ne "y" -and $deleteme -ne "n" ) {
    $deleteme = Read-Host "Vuoi eliniare la cartella Si=[y] No=[n]:"
}
if ($deleteme -eq "y") {
    Remove-Item ".\$mylocation"
}