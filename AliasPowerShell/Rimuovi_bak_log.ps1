Get-ChildItem * -Include *.bak -Recurse | Remove-Item
Get-ChildItem * -Include plot.log -Recurse | Remove-Item
Get-ChildItem * -Include hardcopy.log -Recurse | Remove-Item
Get-ChildItem * -Include acad.err -Recurse | Remove-Item