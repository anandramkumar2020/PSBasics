#Execution Poilcy
#Get-ExecutionPolicy -List
#Set-ExecutionPolicy -ExecutionPolicy AllSigned -All scripts to be digitally signed

#Script Editor -VS Code
#Install extensions

#Combine a group of related commands
#notepad Myfirstscript.ps1 --> Create an empty file with .ps1
#.\Myfirstscript.ps1 --> Run script

Test-connection -ComputerName ANANDRAMKUMAR -Quiet -Count 1
Get-Service -Name MYSQL80


