#Invoke-Pester -Output Detailed  .\_004_CheckJSONToObject.Tests.ps1

BeforeAll {
    $jsonContent = Get-Content -Path .\SampleJSon.json | ConvertFrom-Json
}
Describe "Json Object" {
    It "Validate Monopoly exsist as boardgame" {
        ($jsonContent.games[0].subcategories[1].name) | Should -Be "Monopoly"
    }
}