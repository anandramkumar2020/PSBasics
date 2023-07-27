#region stage 1 function scaffolding
# Get-module -ListAvailable -Name ComputerInventory
# Get-command -Module ComputerInventory
Function Get-MemoryInfo {
    [CmdletBinding()]
    param ()
}

Function Get-StorageInfo {
    [CmdletBinding()]
    param ()
}

Function Get-ProcessorInfo {
    [CmdletBinding()]
    param ()

}
#endregion

#region stage 2 OutObject represented as HashTable
# Get-module -ListAvailable -Name ComputerInventory
# Get-command -Module ComputerInventory
Function Get-MemoryInfo {
    [CmdletBinding()]
    param ()

    #OutObject represented as a HashTable
    $outObject = @{
        'ComputerName'     = ''             #Remote Computer Name
        'HardwareCategory' = 'Memory'   
        'info'             = $null
    }

    $outObject
}

Function Get-StorageInfo {
    [CmdletBinding()]
    param ()

    $outObject = @{
        'ComputerName'     = ''
        'HardwareCategory' = 'Storage'
        'info'             = $null
    }

    $outObject
}

Function Get-ProcessorInfo {
    [CmdletBinding()]
    param ()

    $outObject = @{
        'ComputerName'     = ''
        'HardwareCategory' = 'Processor'
        'info'             = $null
    }

    $outObject
}
#endregion

#region stage 3 Provide the remote session and computer name
#Get-Service -Name Winrm | Start-Service 
#$PSSession = New-PSSession -ComputerName ANANDRAMKUMAR
# 
Function Get-MemoryInfo {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.Management.Automation.Runspaces.PSSession] $Session     #Remote Session
    )

    #OutObject represented as a HashTable
    $outObject = @{
        'ComputerName'     = $PSSession.ComputerName             #Remote Computer Name
        'HardwareCategory' = 'Memory'   
        'info'             = $null
    }

    $outObject
}
#endregion

#region stage 4 Fill up with actual Hardware information
#Get-CimInstance -ClassName Win32_PhysicalMemory
#Execute script block which contains command
#Return result to test the function 
Function Get-MemoryInfo {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.Management.Automation.Runspaces.PSSession] $Session     #Remote Session
    )

    #OutObject represented as a HashTable
    $outObject = @{
        'ComputerName'     = $Session.ComputerName             #Remote Computer Name
        'HardwareCategory' = 'Memory'   
        'info'             = $null
    }

    $scriptBlock = {
        Get-CimInstance -ClassName Win32_PhysicalMemory
    }
    $result = Invoke-Command -Session $Session -ScriptBlock $scriptBlock
    
    $result

    #$outObject
}
#endregion

#region stage 5 Create a standard output
#Creates a custom PowerShell object using  PSCustomObject
#Cast the output hashtable to pscustomobject
#Helper function to convert to GB - (ConvertTo-Gb -Bytes $_.Capacity)

Function Get-MemoryInfo {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.Management.Automation.Runspaces.PSSession] $Session     #Remote Session
    )

    #OutObject represented as a HashTable
    $outObject = @{
        'ComputerName'     = $Session.ComputerName             #Remote Computer Name
        'HardwareCategory' = 'Memory'   
        'info'             = $null
    }

    $scriptBlock = {
        Get-CimInstance -ClassName Win32_PhysicalMemory
    }
    $result = Invoke-Command -Session $Session -ScriptBlock $scriptBlock
    
    $info = $result | ForEach-Object { #For Each result a custom object is created
        [PSCustomObject]@{                          #Having 3 properties
            'Manufacturer'  = $_.Manufacturer
            'Capacity'      = $_.Capacity
            'DeviceLocator' = $_.DeviceLocator
        }
    }
    $outObject['info'] = $info
    [PSCustomObject]$outObject                      #Cleaner Output
}


function ConvertTo-Gb {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$Bytes
    )

    $numberGb = $Bytes / 1GB
    [Math]::Round($numberGb, 2)
}

#endregion


#region stage 6 Adding resiliency to the module 
#enclose in a  try-catch block
#Add terminating error
#Add Help file

Function Get-MemoryInfo {

    <#
    .SYNOPSIS
    Retrieves memory information from a remote computer using a PSSession.

    .DESCRIPTION
    The Get-MemoryInfo function retrieves information about physical memory (RAM) from a remote computer using a PowerShell PSSession.

    .PARAMETER Session
    The PSSession object representing the remote session to the target computer.

    .EXAMPLE
    Get-MemoryInfo -Session $remoteSession

    Retrieves memory information from the remote computer specified in the PSSession $remoteSession.

    .OUTPUTS
    The function returns a custom PowerShell object with the following properties:
    - ComputerName: The name of the remote computer.
    - HardwareCategory: The category of the hardware (always 'Memory').
    - Info: An array of custom objects, each containing the following properties:
      - Manufacturer: The manufacturer of the physical memory module.
      - Capacity: The capacity of the physical memory in GB.
      - DeviceLocator: The physical location or identifier of the memory module.

    If an error occurs, the function returns an object with the 'Info' property containing the error message.

    .NOTES
    The function requires PowerShell remoting to be enabled on the remote computer and the appropriate permissions to execute the Get-CimInstance cmdlet remotely.
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.Management.Automation.Runspaces.PSSession] $Session     #Remote Session
    )

    

    try {
        #OutObject represented as a HashTable
        $outObject = @{
            'ComputerName'     = $Session.ComputerName             #Remote Computer Name
            'HardwareCategory' = 'Memory'   
            'info'             = $null
        }

        $scriptBlock = {
            Get-CimInstance -ClassName Win32_PhysicalMemory
        }

        $result = Invoke-Command -Session $Session -ScriptBlock $scriptBlock -ErrorAction Stop
    
        $info = $result | ForEach-Object { #For Each result a custom object is created
            [PSCustomObject]@{                          #Having 3 properties
                'Manufacturer'  = $_.Manufacturer
                'Capacity'      = ConvertTo-Gb -Bytes $_.Capacity
                'DeviceLocator' = $_.DeviceLocator
            }
        }
        $outObject['info'] = $info
        [PSCustomObject]$outObject                      #Cleaner Output
    }
    catch {
        $outObject['info'] = $_.Exception.Message
        [PSCustomObject]$outObject 
    }
}

#endregion