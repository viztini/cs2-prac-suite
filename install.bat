@echo off
setlocal enabledelayedexpansion

for /f "tokens=2*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 730" /v "InstallLocation" 2^>nul') do (
    set "CS2_PATH=%%B"
)

if not defined CS2_PATH (
    echo [!] Could not find CS2 installation. Please copy .cfg files manually.
    pause
    exit /b
)

set "CFG_DEST=%CS2_PATH%\game\csgo\cfg"

echo [+] CS2 Found at: %CS2_PATH%
echo [+] Copying configs to: %CFG_DEST%

copy /y "wallhackprac.cfg" "%CFG_DEST%\"
copy /y "realism.cfg" "%CFG_DEST%\"

echo.
echo ----------------------------------------------------------------
echo [SUCCESS] Installation Complete!
echo.
echo HOW TO USE:
echo 1. Launch CS2 and start a Practice match (with Cheats enabled).
echo 2. Open the Developer Console (~).
echo 3. Type "exec wallhackprac" or "exec realism" to start.
echo ----------------------------------------------------------------
pause
