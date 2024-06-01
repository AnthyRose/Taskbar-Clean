# Warning
Read-Host "This will end all open Windows. Are you sure yau want to do this?"
Read-Host "This is your last chance. You sure you want this?"

# Get all processes with a visible window
$processes = Get-Process | Where-Object { $_.MainWindowHandle -ne 0 }

foreach ($process in $processes) {
    try {
        Stop-Process -Id $process.Id -Force
        Write-Host "Terminated process: $($process.ProcessName)"
    } catch {
        Write-Host "Failed to terminate process: $($process.ProcessName) - $_"
    }
}
