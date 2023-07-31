#Invoke-Pester -Output Detailed  .\_002_CheckServiceStatus.Tests.ps1
Describe "_002_StartRequiredService" {

    Context "Service status validation" {
        It "Returns <Status> for <Service>" -ForEach @(
            @{ Service = "Winrm"; Status = "Running"}
            @{ Service = "MySQL80"; Status = "Running"}
            @{ Service = "mosquitto"; Status = "Running"}
        ) {
            ((Get-Service -Name $Service | Select-Object Status).Status) | Should -Be $Status
        }
    }

}

    