@echo off

cd ..
echo Running JUnit tests...

java -cp "bin;lib/*" org.junit.runner.JUnitCore Practice.ProgramTest

pause
