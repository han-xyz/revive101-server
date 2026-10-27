@echo off
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Imlight-Console.ps1" %*
set "consoleResult=%errorlevel%"
if not "%consoleResult%"=="0" pause
exit /b %consoleResult%
