@echo off
setlocal

REM === Set recipient and message content ===
set "TO_EMAIL=mayurjungari1@gmail.com"
set "SUBJECT=Simple Notification"
set "BODY=Hello from Pre-scient!"

REM === Jenkins should inject SMTP_PASS as a secret environment variable ===
set "SMTP_USER=mayurj@pre-scient.com"
set "SMTP_PASS=%SMTP_PASS%"

REM === Send email using PowerShell ===
powershell -ExecutionPolicy Bypass -Command ^
  "$smtpServer = 'smtp.office365.com';" ^
  "$smtpFrom = '%SMTP_USER%';" ^
  "$smtpTo = '%TO_EMAIL%';" ^
  "$smtpUser = '%SMTP_USER%';" ^
  "$smtpPass = '%SMTP_PASS%';" ^
  "$msg = New-Object System.Net.Mail.MailMessage $smtpFrom, $smtpTo, '%SUBJECT%', '%BODY%';" ^
  "$smtp = New-Object Net.Mail.SmtpClient($smtpServer, 587);" ^
  "$smtp.EnableSsl = $true;" ^
  "$smtp.Credentials = New-Object System.Net.NetworkCredential($smtpUser, $smtpPass);" ^
  "$smtp.Send($msg);"

endlocal
