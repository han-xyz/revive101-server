@echo off
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Start-Client.ps1" -Server production
set "clientResult=%errorlevel%"
if not "%clientResult%"=="0" pause
exit /b %clientResult%
