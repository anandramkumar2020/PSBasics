$container = New-PesterContainer -Path "_001_BasicStructure.Tests.ps1" -Data @{
    #Supply expected value from a configuration file
    EXPECTED_VALUE = 100
}

$pesterConfig = [PesterConfiguration]@{
    Run          = @{
        Exit      = $true
        Container = $container
    }
    Output       = @{
        Verbosity = 'Detailed'
    }
    TestResult   = @{
        Enabled      = $true
        OutputFormat = "NUnitXml"
        OutputPath   = $xmlpath
    }
    Should       = @{
        ErrorAction = 'Stop'
    }
    Filter       = @{
        Tag        = ''
        ExcludeTag = ''
    }

    TestRegistry = @{
        Enabled = $true
    }
}

Invoke-Pester -Configuration $pesterConfig