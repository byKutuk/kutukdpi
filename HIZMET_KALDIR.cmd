@echo off
if /i not "%~1"=="admin" (
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
    if errorlevel 1 (
        powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -ArgumentList 'admin' -Verb RunAs"
        exit /b
    )
)

echo KutukDPI durduruluyor...
taskkill /F /IM kutukdpi.exe 2>nul
taskkill /F /IM ciadpi.exe 2>nul

sc stop KutukProxy 2>nul
sc delete KutukProxy 2>nul
sc stop KutukDPI 2>nul
sc delete KutukDPI 2>nul
sc stop WinDivert 2>nul
sc delete WinDivert 2>nul

netsh advfirewall firewall delete rule name="KutukDPI ByeDPI" >nul 2>&1

for /d %%D in ("%LOCALAPPDATA%\Discord\app-*") do (
    del "%%D\version.dll" 2>nul
    del "%%D\drover.ini" 2>nul
    del "%%D\d3d11.dll" 2>nul
)

echo Hizmetler ve Discord drover kaldirildi.
pause
