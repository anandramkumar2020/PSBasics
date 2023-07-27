
#region for loop

for ($i = 0; $i -lt 5; $i++) {
    Write-Host "This is iteration $i"
}

#endregion

#region read configuration files from server using foreach
$servers = @('Serv1','Serv2','Serv3')
# Get-content -Path \\$($servers[0])\shared_folder\configuration.json
# Get-content -Path \\$($servers[1])\shared_folder\configuration.json
# Get-content -Path \\$($servers[2])\shared_folder\configuration.json

foreach ($server in $servers) {
    if(Test-Path -Path "\\$server\shared_folder\configuration.json") {
        Get-Content -Path $path
    }
    else {
        Write-Host "$server is offline"
    }
}
#More Of a PowerShell Way
$servers | ForEach-Object {
    if(Test-Path -Path "\\$server\shared_folder\configuration.json") {
        Get-Content -Path $path
    }
    else {
        Write-Host "$server is offline"
    }
}
#endregion

#region while & do loop
Get-help about_While
Get-help about_Do   
#endregion
