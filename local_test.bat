@echo off
for /f "tokens=1-3 delims=-: " %%a in ('echo %DATE% %TIME%') do set DATETIME=%%a-%%b-%%c_%%d
echo %DATE% %TIME% >> contribuition.txt
git add -A
git commit -m "Add hourly contribution"
git status
