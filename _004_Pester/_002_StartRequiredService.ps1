Function Start-RequiredService {
    [CmdletBinding()]
    param ()

    If(Test-Path -Path Services.txt) {
        Get-Content -Path Services.txt | Get-Service | Start-Service
    }
    else {
        Write-Error "Missing service list"
    }
    
}