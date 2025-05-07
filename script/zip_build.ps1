# zip_all.ps1

# Create a 'build' folder if it doesn't exist
if (-not (Test-Path "build")) {
    New-Item -ItemType Directory -Path "build" | Out-Null
}

# Set a timestamp for uniqueness
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$zipFile = "build\build_$timestamp.zip"

# Zip the directories 'bin', 'logs', and 'shared'
Compress-Archive -Path "bin", "logs", "shared" -DestinationPath $zipFile -Force

Write-Host "Zipped file created at: $zipFile"
