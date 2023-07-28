#Invoke-Pester -Output Detailed  .\ComputerInventory.Tests.ps1
BeforeAll {
    Import-Module -Name ComputerInventory -Force
    $session = New-PSSession -ComputerName ANANDRAMKUMAR
}
Describe "Computer Inventory" {
    Context "Memory" {
        It "Capacity to return 16" {
            (((Get-MemoryInfo -Session $session).info).capacity) | Should -Be 16
        }
        It "Device locator to return DIMM 1" {
            (((Get-MemoryInfo -Session $session).info).DeviceLocator) | Should -Be "DIMM 1"
        }
    }
}