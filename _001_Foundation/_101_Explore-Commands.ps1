#Commands
#Get-Alias
#Get-Command
#Get-History #--> Shows history of commands
#Get-History -count 15 #--> Shows last 15 commands
#Get-service | Where-Object { $_.Status -eq 'Running' } --> All running service


#Help
#Get-Help -Name Get-Service #--> Help from PS Help system
#Get-Help Get-Service -ShowWindow
#Get-Help Get-Service -online
#Update-Help #Download latest help from MS
#Get-Help about*
#Get-help -verb Get | Select-Object -First 1 | Get-Member