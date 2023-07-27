#region Remove a readonly file
Remove-Item -Path .\Resources\SampleReadOnly.txt
Write-Host "File removed successfully"
#endregion

#region Implement Try catch
#Exception Object --> $error[0].Exception | gm
try {
    Remove-Item -Path .\Resources\SampleReadOnly.txt #-ErrorAction Stop
    Write-Host "File removed successfully"
}
catch [System.IO.IOException] {
    Write-Warning "File not removed due to an IO exception"
}
#endregion

#region Implement Try catch 

try {
    Remove-Item -Path .\Resources\SampleReadOnly.txt -ErrorAction Stop
    Write-Host "File removed successfully"
}
catch [System.IO.IOException] {
    Write-Warning "File not removed due to an IO exception :"
}
catch {
    # Catch any other exceptions that were not caught explicitly
    Write-Warning "An unexpected error occurred: $($_.Exception.Message)"
}


#endregion
