#region Stage 1 FileUncompression using Add-Content 
Add-Content -path _104_Application-LogFile.txt -value "Starting to uncompress...."
Expand-Archive FileZipped.zip -DestinationPath .
Add-Content -path _104_Application-LogFile.txt -value "Finished uncompress...."
#endregion

#region Stage 2 Using function to add time
function Write-Log {

    [CmdletBinding()]
    param ()

    $timeGenerated = Get-Date -Format HH:MM
    Add-Content -path _104_Application-LogFile.txt -value " $timeGenerated : Starting to uncompress...."

}

Add-Content -path _104_Application-LogFile.txt -value "Starting to uncompress...."
Expand-Archive .\Resources\FileZipped.zip -DestinationPath .\Resources\
Add-Content -path _104_Application-LogFile.txt -value "Finished uncompress...."
#endregion

#region Stage 3 Custom log message & Manadatory param
function Write-Log {

    [CmdletBinding()]
    param (
        # Custom log message
        [Parameter(Mandatory)]
        #[Parameter()]
        [String]$LogMessage
    )

    $timeGenerated = Get-Date -Format HH:MM
    Add-Content -path _104_Application-LogFile.txt -value " $timeGenerated : $LogMessage "

}

#endregion

#region Stage 4 Adding a log file path as default value
function Write-Log {

    [CmdletBinding()]
    param (
        # Custom log message
        #[Parameter()]
        [Parameter(Mandatory)]
        [String]$LogMessage,

        # log file path
        [Parameter()]
        [String]$LogFilePath = "_104_Application-LogFile.txt"
    )

    $timeGenerated = Get-Date -Format HH:MM
    Add-Content -path $LogFilePath -value " $timeGenerated : $LogMessage "

}

#endregion

#region Stage 5 validating the parameter
function Write-Log {

    [CmdletBinding()]
    param (
        # Custom log message
        #[Parameter()]
        [Parameter(Mandatory)]
        [String]$LogMessage,

        # log file path
        [Parameter()]
        [ValidateScript({ Test-Path -Path $_ })]
        [String]$LogFilePath = "_104_Application-LogFile.txt"
    )

    $timeGenerated = Get-Date -Format HH:MM
    Add-Content -path $LogFilePath -value " $timeGenerated : $LogMessage "

}

#endregion

#region Stage 6 adding help
function Write-Log {

    <#
.SYNOPSIS
Write-Log function writes a custom log message to a log file.

.DESCRIPTION
The Write-Log function allows you to write a custom log message to a log file with a timestamp. By default, the log message will be appended to the file "_104_Application-LogFile.txt" in the current working directory.

.PARAMETER LogMessage
Specifies the custom log message that you want to write to the log file.

.PARAMETER LogFilePath
Specifies the path to the log file where the log message will be written. The default value is "_104_Application-LogFile.txt" in the current working directory. The file path must be a valid path.

.EXAMPLE
Write-Log -LogMessage "This is an informational message."

This example writes an informational message "This is an informational message." to the default log file "_104_Application-LogFile.txt".

.EXAMPLE
Write-Log -LogMessage "An error occurred" -LogFilePath "C:\Logs\ApplicationLog.txt"

This example writes an error message "An error occurred" to the log file "C:\Logs\ApplicationLog.txt".

.NOTES
- This function requires Write permission to the specified log file path.
- The log file will be created if it doesn't exist.
- The function appends the log message to the end of the file.
#>

    

    [CmdletBinding()]
    param (
        # Custom log message
        #[Parameter()]
        [Parameter(Mandatory)]
        [String]$LogMessage,

        # log file path
        [Parameter()]
        [ValidateScript({ Test-Path -Path $_ })]
        [String]$LogFilePath = "_104_Application-LogFile.txt"
    )

    $timeGenerated = Get-Date -Format HH:MM
    Add-Content -path $LogFilePath -value " $timeGenerated : $LogMessage "

}

#endregion
