@echo off
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Start-Client.ps1" -Server local
set "clientResult=%errorlevel%"
if not "%clientResult%"=="0" pause
exit /b %clientResult%
