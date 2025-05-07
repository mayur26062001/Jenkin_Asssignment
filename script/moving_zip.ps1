# Use Jenkins environment variables to dynamically reference paths
$workspace = $env:WORKSPACE  # Jenkins workspace directory
$destinationFolder = "$workspace\releases"  # Path to your releases folder in Jenkins workspace
$zipFilePath = "$workspace\build\your-zip-file.zip"  # Path to the ZIP file in Jenkins workspace

# Check if the ZIP file exists before moving it
if (Test-Path $zipFilePath) {
    # Create destination folder if it doesn't exist
    if (-not (Test-Path $destinationFolder)) {
        New-Item -ItemType Directory -Path $destinationFolder
    }

    # Move the ZIP file
    Move-Item -Path $zipFilePath -Destination $destinationFolder
    Write-Host "✅ Successfully moved the zip file to the $destinationFolder folder."
} else {
    Write-Host "❌ The ZIP file does not exist at $zipFilePath."
}
