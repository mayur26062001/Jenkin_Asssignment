@echo off
setlocal

REM Set recipient and message
set "TO_EMAIL=mayurjungari2606@gmail.com"  REM The recipient's email address
set "SUBJECT=Simple Notification"
set "BODY=Hello from Mayur Jungari!"

REM SMTP credentials and settings (injected by Jenkins)
set "SMTP_USER=mayurjungari1@gmail.com"  REM Gmail address for authentication
set "SMTP_PASS=%SMTP_PASS%"  REM This is securely injected in Jenkins

REM Send email using PowerShell
powershell -ExecutionPolicy Bypass -Command ^
  "$smtpServer = 'smtp.gmail.com';" ^
  "$smtpFrom = 'mayurjungari1@gmail.com';"  REM The sender's email address (your Gmail address) ^
  "$smtpTo = '%TO_EMAIL%';" ^
  "$smtpUser = '%SMTP_USER%';" ^
  "$smtpPass = '%SMTP_PASS%';" ^
  "$msg = New-Object System.Net.Mail.MailMessage $smtpFrom, $smtpTo, '%SUBJECT%', '%BODY%';" ^
  "$smtp = New-Object Net.Mail.SmtpClient($smtpServer, 587);" ^
  "$smtp.EnableSsl = $true;" ^
  "$smtp.Credentials = New-Object System.Net.NetworkCredential($smtpUser, $smtpPass);" ^
  "$smtp.Send($msg);"

endlocal
