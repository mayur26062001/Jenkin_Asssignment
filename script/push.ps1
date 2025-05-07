# Set folder path and zip file name
$folder = "C:\Users\mayurj\Desktop\Check\releases"
$zipFile = "output.zip"

# Go to the folder
cd $folder

# Git user config
git config user.name "Mayur Jungari"
git config user.email "mayurj@pre-scient.com"

# Initialize Git repo if not already done
if (-not (Test-Path "$folder\.git")) {
    git init
    git remote add origin https://github.com/mayur26062001/Jenkin_Asssignment
}

# Add, commit, and push the ZIP file
git add $zipFile
git commit -m "✅ Added ZIP file from Jenkins"
git push origin master

Write-Host "✅ ZIP file pushed to GitHub successfully."
