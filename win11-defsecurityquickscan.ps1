# Get the current date in "yyyyMMdd" format
$Date = Get-Date -Format "yyyyMMdd"

# Define the directory for the log file
$LogDirectory = "$env:USERPROFILE\Documents\defender-scan"

# Ensure the directory exists
if (-not (Test-Path -Path $LogDirectory)) {
    New-Item -ItemType Directory -Path $LogDirectory -Force
}

# Define the full log file path with the date in the filename
$Logfile = Join-Path -Path $LogDirectory -ChildPath "defender-quick-scan-$Date.log"


# Ensure the directory exists
$LogDirectory = [System.IO.Path]::GetDirectoryName($Logfile)
if (-not (Test-Path $LogDirectory)) {
    New-Item -ItemType Directory -Path $LogDirectory -Force
}

# Function to write log messages
function WriteLog {
    Param ([string]$LogString)
    $Stamp = (Get-Date).ToString("yyyy/MM/dd HH:mm:ss")
    $LogMessage = "$Stamp $LogString"
    Add-Content -Path $Logfile -Value $LogMessage
}

#Scan Results in variable format
$ScanStatus = Get-MpComputerStatus | Select-Object FullScanEndTime, FullScanOverdue, FullScanRequired, FullScanSignatureVersion, FullScanStartTime, QuickScanStartTime, QuickScanEndTime

# Write log messages
WriteLog "Starting scheduled Windows Security scan..."
Write-Output "Starting scheduled Windcows Security scan..."
try {
    Start-MpScan -ScanType QuickScan
    WriteLog "Quick scan initiated successfully." 
    Write-Output "Quick scan initiated successfully."
    ###########
    WriteLog "Scan status:"
    Write-Output "Scan status:" 
    WriteLog ($ScanStatus | Out-String)
    Write-Output ($ScanStatus | Out-String)
    WriteLog "The Windows Security scan is now complete!"
} catch {
    Write-Output "The Windows Security scan is now complete!"
    WriteLog "An error occurred during the scan: $_"
    Write-Output "An error occurred during the scan: $_" 
}