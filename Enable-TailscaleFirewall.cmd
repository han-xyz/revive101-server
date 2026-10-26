@echo off
setlocal
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Enable-TailscaleFirewall.ps1"
set "firewallResult=%errorlevel%"
if not "%firewallResult%"=="0" echo Right-click this file and select Run as administrator after Tailscale is connected.
pause
exit /b %firewallResult%
