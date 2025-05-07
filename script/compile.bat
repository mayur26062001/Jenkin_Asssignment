@echo off

cd ..
echo Compiling Java files...

if not exist bin mkdir bin

javac -cp "lib/*" -d bin Practice\Program.java Practice\ProgramTest.java

if %ERRORLEVEL% NEQ 0 (
    echo Compilation failed.
) else (
    echo Compilation successful.
)

pause
