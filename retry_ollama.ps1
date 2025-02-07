# while ($true) {
#     Write-Output "Running 'ollama run deepseek-r1:14b'..."
#     ollama run deepseek-r1:14b
#     if ($LASTEXITCODE -eq 0) {
#         Write-Output "Download completed successfully!"
#         break
#     } else {
#         Write-Output "An error occurred. Retrying in 5 seconds..."
#         Start-Sleep -Seconds 5
#     }
# }


$lastPercentage = 0

while ($true) {
    Write-Output "Running 'ollama run deepseek-r1:14b'..."
    $process = Start-Process "ollama" -ArgumentList "run deepseek-r1:14b" -NoNewWindow -PassThru -RedirectStandardOutput "output.txt"
    
    while ($true) {
        if (Test-Path "output.txt") {
            $line = Get-Content "output.txt" -Tail 1
            if ($line -match "(\d+)%") {
                $currentPercentage = [int]$matches[1]
                Write-Output "Current progress: $currentPercentage%"

                # Check if percentage dropped
                if ($currentPercentage -lt $lastPercentage) {
                    Write-Output "Error: Percentage dropped from $lastPercentage% to $currentPercentage%. Restarting download..."
                    $process.Kill()
                    break
                }

                # Calculate remaining percentage
                $remainingPercentage = 100 - $currentPercentage
                Write-Output "Remaining: $remainingPercentage%"

                # Update lastPercentage
                $lastPercentage = $currentPercentage
            }
        }

        Start-Sleep -Seconds 1
        if ($process.HasExited) {
            if ($process.ExitCode -eq 0) {
                Write-Output "Download completed successfully!"
                break 2
            } else {
                Write-Output "An error occurred. Retrying in 5 seconds..."
                Start-Sleep -Seconds 5
                break
            }
        }
    }
}
