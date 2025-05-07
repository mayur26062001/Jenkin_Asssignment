# zip_all.ps1


if (-not (Test-Path "build")) {
    New-Item -ItemType Directory -Path "build" | Out-Null
}


$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$zipFile = "build\build_$timestamp.zip"


Compress-Archive -Path "bin", "logs", "shared" -DestinationPath $zipFile -Force

Write-Host "Zipped file created at: $zipFile"
