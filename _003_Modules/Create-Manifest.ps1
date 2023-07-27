#Usage of Manifest
#Describe Module Metadata
#Instructions of mudule importing
#Restrictions for execution


#Create New Manifest
New-ModuleManifest -Path 'C:\Users\anand.ramkumar\Documents\PowerShell\Modules\ComputerInventory\ComputerInventory.psd1' -RootModule 'ComputerInventory.psm1' -Guid (New-Guid).Guid -Author 'Anand Ramkumar' -CompanyName 'Experion Technologies' -FunctionsToExport 'Get-MemoryInfo' -CompatiblePSEditions Core

#Test Manifest
Test-ModuleManifest -Path 'C:\Users\anand.ramkumar\Documents\PowerShell\Modules\ComputerInventory\ComputerInventory.psd1'

