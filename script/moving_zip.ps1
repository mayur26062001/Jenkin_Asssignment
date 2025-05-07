$destinationFolder = "C:\Users\mayurj\Desktop\Check\releases"
$zipFilePath = "C:\Users\mayurj\Desktop\Check\build\your-zip-file.zip" 

Move-Item -Path $zipFilePath -Destination $destinationFolder

Write-Host " Successfully moved the zip file to the $destinationFolder folder."
