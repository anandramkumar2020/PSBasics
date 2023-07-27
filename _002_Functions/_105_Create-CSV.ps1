@(
    [PSCustomObject]@{'ComputerName' = 'QA'; 'Version' = 'VER-2.0.2'}
    [PSCustomObject]@{'ComputerName' = 'UAT'; 'Version' = 'VER-2.0.1'}
    [PSCustomObject]@{'ComputerName' = 'PROD'; 'Version' = 'VER-1.0.0'}
) | Export-CSV -Path "_105_AppVersion.csv"