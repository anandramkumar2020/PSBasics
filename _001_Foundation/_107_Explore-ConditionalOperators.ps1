#get-help about_Booleans
#get-help about_Logical_Operators
#get-help about_Switch

#region evaluates to true
if (1 -eq 1) {
    Write-Host '1 equal 1'
}

#endregion

#region evaluates to false
if (1 -eq 2) {
    Write-Host '1 equal 2'
}
else {
    Write-Host '1 not equal 2'
} 
#endregion

#region List of server in my farm
$servers = @('srv1','ANANDRAMKUMAR','srv2')
#endregion

#region Read configuration file from server 1
if(Test-Connection -ComputerName $servers[0] -Quiet -Count 1) {
    #Get-Content -Path "\\$($servers[0])\shared_folder\Resources\Configuration.json" #UNC Path
    Get-content -Path D:\PSBasics-Workspace\PSBasics\Resources\Configuration.json
}
else {
    Write-Host "Connection to server $($servers[0]) is not available"
}
#endregion

#region Read configuration file from server 2
if(Test-Connection -ComputerName $servers[1] -Quiet -Count 1 ) {
    #Get-Content -Path "\\$($servers[0])\shared_folder\Resources\Configuration.json" #UNC Path
    Get-content -Path D:\PSBasics-Workspace\PSBasics\Resources\Configuration.json
}
else {
    Write-Error "Connection to server $($servers[1]) is not available"
}
#endregion

#region Read configuration file from server 3
if(Test-Connection -ComputerName $servers[2] -Quiet -Count 1) {
    #Get-Content -Path "\\$($servers[0])\shared_folder\Resources\Configuration.json" #UNC Path
    Get-content -Path D:\PSBasics-Workspace\PSBasics\Resources\Configuration.json
}
else {
    Write-Error "Connection to server $($servers[2]) is not available"
}
#endregion

#region Check server 2 is online and configuration file exist
if((Test-Connection -ComputerName $servers[1] -Quiet -Count 1) -And (Test-Path D:\PSBasics-Workspace\PSBasics\Resources\Configuration.json)) {
    #Get-Content -Path "\\$($servers[0])\shared_folder\Resources\Configuration.json" #UNC Path
    #Test-Path D:\PSBasics-Workspace\PSBasics\Resources\Configuration.json
    Get-content -Path D:\PSBasics-Workspace\PSBasics\Resources\Configuration.json
}
else {
    Write-Error "Connection to server $($servers[1]) is not available or file not available"
}
#endregion

#region switch statements 

$domainServer = @('srv1','srv2','srv3')
$currentServer = $domainServer[1]

switch ($currentServer) {
    'srv1' {
        Write-Host "Current server is $_" #Automatic variable
        break
    }
    'srv2' {
        Write-Host "Current server is $_"
        break
    }
    'srv3' {
        Write-Host "Current server is $_"
        break
    }
}

#endregion

