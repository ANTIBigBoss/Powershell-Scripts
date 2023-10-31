function flip_coin {
    Clear-Host
    # Initialize variables
    $coinFlips = 0
    $heads = 0
    $tails = 0
    # No new line to keep the cursor on the same line so it looks nicer
    Write-Host "Enter number of coin flips: " -NoNewline
    $coinFlips = Read-Host
    Write-Host "" #Spacing the output to make it look closer to example
    for ($i = 0; $i -lt $coinFlips; $i++) {
        $coin = Get-Random -Minimum 0 -Maximum 2
        if ($coin -eq 0) {
            $heads++ # Increment heads if we get a 0
        }
        else {
            $tails++ # Increment tails if we get a 1
        }
    }
    #Display the percentage of heads and tails to the user
    Write-Host "Percentage of heads: " -NoNewline
    Write-Host ('{0:N2}' -f ($heads / $coinFlips * 100)) -NoNewline
    Write-Host "%"
    Write-Host "Percentage of tails: " -NoNewline
    Write-Host ('{0:N2}' -f ($tails / $coinFlips * 100)) -NoNewline
    Write-Host "%"
}
flip_coin