function nameStatus{
Clear-Host
Write-Host "Name        Status"
Write-Host "-----       ------"
$services = @('Spooler', 'Fax', 'Appinfo', 'Bits', 'Audiosrv')
# Loop through the array and display the running services
foreach ($service in $services) {
    # Get the status of the service
    $status = Get-Service -ErrorAction SilentlyContinue $service | Select-Object -ExpandProperty Status -ErrorAction SilentlyContinue
    # If the status is running then we display the service
    if ($status -eq 'Running') {
        # I use padding to make the output look nicer
        Write-Host $service.PadRight(11) $status
    }
    elseif($status -eq 'Stopped') {
        Write-Host $service.PadRight(11) $status
        
        }
    else {
        Write-Host $service.PadRight(11) "Unable to locate"
    
    }
}
}
nameStatus