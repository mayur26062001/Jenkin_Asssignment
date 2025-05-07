@echo off

REM Go to project root
cd ..

echo Running output.jar in background...
echo Logs will be saved to logs\app.log

REM Create logs directory if it doesn't exist
if not exist logs (
    mkdir logs
)

REM Run the JAR in background and redirect output to log file
start javaw -jar output.jar > logs\app.log 2>&1

echo output.jar is running in the background.
pause
