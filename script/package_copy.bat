@echo off


cd ..

echo Creating output.jar from bin directory...


jar cf output.jar -C bin .


if exist output.jar (
    echo output.jar created successfully.
) else (
    echo Failed to create output.jar
    pause
    exit /b 1
)


if not exist shared (
    mkdir shared
    echo Created shared folder.
)

echo Copying output.jar to shared folder...


copy /Y output.jar shared\

if %ERRORLEVEL% NEQ 0 (
    echo Copy to shared folder failed.
) else (
    echo Copy to shared folder successful.
)

pause
