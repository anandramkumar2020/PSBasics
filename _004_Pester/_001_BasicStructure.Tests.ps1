
#Invoke-Pester -Output Detailed  .\_001_BasicStructure.Tests.ps1
#Invoke-Pester -Output Detailed  -TagFilter "UnitTest" .\_001_BasicStructure.Tests.ps1 

BeforeDiscovery {
   Write-Host ">>> Text in BeforeDiscovery"
}

BeforeAll {
    Write-Host ">>> Text in BeforeAll"
}

Describe "Pester Installation" {

    Context "Hello World" {

        It "Test Pass"  {
            2 + 3 | Should -Be 5
        }
        It "Test Fail"  {
            2 + 3 | Should -Be 6
        }
        It "Test Pass"  {
            2 + 3 | Should -Be 5
        }
        It "Test Tagged" -Tag "UnitTest" {
            2 * 3 | Should -Be 6
        }
        It "Test Skipped" -Skip {
            Write-Host "WIP"
        }
    }
}
