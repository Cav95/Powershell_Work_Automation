Set-Location "C:\Program Files\Siemens\Solid Edge 2019\Preferences"
Move-Item .\SELicense.dat .\2-SELicense.dat
Move-Item .\1-SELicense.dat .\SELicense.dat
Move-Item .\2-SELicense.dat .\1-SELicense.dat