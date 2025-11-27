function Ask-Confirm {
	[CmdletBinding()]
	    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [String]$phrase
    )
$req = ""
$command=" Si=[y] No=[n]:"

while ($req -ne "y" -and $req -ne "n" ) {
    $req = Read-Host "$phrase$command"
}
	if ($req -eq "y") {
    return $true
		}else{ return $false}
}

#ask -phrase "pippo?"