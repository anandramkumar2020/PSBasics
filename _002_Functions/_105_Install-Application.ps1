#region Stage 1 Taking value from Pipeline , oops we have error
#$ComputerName = @('SERV1','SERV2','SERV3') 
Function Install-Application {
  [CmdletBinding()]
  param(
    [parameter(ValueFromPipeline)]
    [string]$ComputerName,

    [parameter()]
    [string]$Version

  )

  Write-Host "Installing software $Version on Server $ComputerName "
}
#endregion


#region Stage 2 using the Process block
#$ComputerName = @('SERV1','SERV2','SERV3')   
Function Install-Application {
  [CmdletBinding()]
  param(
    [parameter(ValueFromPipeline)]
    [string]$ComputerName,

    [parameter()]
    [string]$Version

  )

  Begin {
    Write-Host "Let's do some initial setup"
  }

  Process {
    Write-Host "Installing software $Version on Server $ComputerName"
    # Your actual installation code can be added here
  }

  End {
    Write-Host "Let's do teardown"
  }
}
#endregion

#region Stage 3 add help file
#Import-Csv .\_105_AppVersion.csv | Install-Application
Function Install-Application {
  <#
.SYNOPSIS
Installs a software application on a remote server.

.DESCRIPTION
The Install-Application function installs a software application on a remote server specified by the ComputerName parameter. It connects to a database during the Begin block, installs the software during the Process block, and performs cleanup after installation during the End block.

.PARAMETER ComputerName
Specifies the name of the remote server where the software application will be installed. This parameter supports pipeline input by property name.

.PARAMETER Version
Specifies the version of the software application to be installed. This parameter supports pipeline input by property name.

.EXAMPLE
Install-Application -ComputerName "Server01" -Version "1.0"

Installs the software application with version "1.0" on the remote server "Server01".

.EXAMPLE
$computers = "Server01", "Server02", "Server03"
$versions = "2.5", "3.1", "4.0"

$computers | ForEach-Object {
    $_ | Install-Application -Version $versions[$computers.IndexOf($_)]
}

Installs the software application with versions "2.5", "3.1", and "4.0" on remote servers "Server01", "Server02", and "Server03", respectively.

.NOTES
- This function requires appropriate permissions to connect to the database and install software on remote servers.
- The function can be used with PowerShell remoting to install software on multiple remote servers simultaneously.
#>

  [CmdletBinding()]
  param(
    [parameter(ValueFromPipelineByPropertyName)]
    [string]$ComputerName,

    [parameter(ValueFromPipelineByPropertyName)]
    [String]$Version
  )

  Begin {
    Write-Host "Connect DB..."
  }
    
  Process {
    Write-Host "Installing software $Version on Server $ComputerName"
  }
  End {
    Write-Host "Teardown Connection ..."
  }
}
#endregion

