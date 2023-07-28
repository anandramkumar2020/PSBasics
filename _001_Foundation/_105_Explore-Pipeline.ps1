#Pipeline - Pass output of one command to another

#Regular Method
# $remoteService = "Winrm"
# Get-service -Name $remoteService 
# Stop-service -Name $remoteService

#Using Pipeline
#Get-service -Name WinRM | Start-Service 
#'WinRM' | Get-Service | Start-Service 


# Get-Service | Stop_service #DON'T DO THIS
# Stop-Service -Name WinRM -WhatIf
# Stop-Service -Name WinRM -Confirm

#Example Services
#Get-content -Path .\Services.txt | Get-Service |Start-Service
#Get-Service -Name Winrm, MySQL80, mosquitto