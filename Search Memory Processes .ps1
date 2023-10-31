function Get-HighestPM {
    Clear-Host
    # Use no new line to keep the cursor on the same line for user input
    Write-Host "Enter name of application: " -NoNewline 
    $name = Read-Host # Get the name of the process from the user
    $processes = Get-Process $name -ErrorAction SilentlyContinue
    # If the process is not found then we display an error message and exit the function
    if ($processes -eq $null) {
         # Ignore any powershell errors and display our own
        Write-Host $name "is not a valid application" -ForegroundColor Red
        return
    }
    $highestPm = 0 # Set at 0 to initialize
    # Using Cmdlets Measure-Object and Select-Object to get the highest PM
    $highestPm = $processes | Measure-Object -Property PM -Maximum | Select-Object -ExpandProperty Maximum
    # Display the highest PM in MB to the user to two decimal points
    Write-Host('Highest PM used by ') -NoNewline
    Write-Host $name "  "-NoNewline -ForegroundColor Black -BackgroundColor Yellow
    #Using same placeholder as the circle area assignment {0.N2}
    Write-Host('   {0:N2} MB' -f ($highestPm / 1MB)) -BackgroundColor Red -ForegroundColor White
}
Get-HighestPM