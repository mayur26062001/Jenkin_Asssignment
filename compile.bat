@echo off
cd ..

echo Compiling Java files...

REM Create bin directory if it doesn't exist
if not exist bin mkdir bin

REM Compile Java files and output .class files to bin/
javac -cp "lib/*" -d bin Practice\Program.java Practice\ProgramTest.java

if %ERRORLEVEL% NEQ 0 (
    echo Compilation failed.
    pause
    exit /b %ERRORLEVEL%
) else (
    echo Compilation successful.
)
pause
