@echo off
setlocal

REM Set recipient and message
set "TO_EMAIL=mayurjungari2606@gmail.com"
set "SUBJECT=Simple Notification"
set "BODY=Hello from Mayur Jungari!"

REM SMTP credentials injected securely via Jenkins credentials
set "SMTP_USER=%SMTP_USER%"
set "SMTP_PASS=%SMTP_PASS%"

REM Log for debugging (optional)
echo Sending mail from: %SMTP_USER% to: %TO_EMAIL%

REM Send email using PowerShell
powershell -ExecutionPolicy Bypass -Command ^
"$smtpServer = 'smtp.gmail.com'; ^
 $smtpFrom = '%SMTP_USER%'; ^
 $smtpTo = '%TO_EMAIL%'; ^
 $smtpUser = '%SMTP_USER%'; ^
 $smtpPass = '%SMTP_PASS%'; ^
 $msg = New-Object System.Net.Mail.MailMessage($smtpFrom, $smtpTo, '%SUBJECT%', '%BODY%'); ^
 $smtp = New-Object Net.Mail.SmtpClient($smtpServer, 587); ^
 $smtp.EnableSsl = $true; ^
 $smtp.Credentials = New-Object System.Net.NetworkCredential($smtpUser, $smtpPass); ^
 try { $smtp.Send($msg); Write-Host 'Email sent successfully.' } ^
 catch { Write-Host 'Failed to send email. Error:'; Write-Host $_.Exception.Message }"

endlocal
