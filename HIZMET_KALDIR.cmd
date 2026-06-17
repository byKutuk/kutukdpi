@echo off
if /i not "%~1"=="admin" (
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
    if errorlevel 1 (
        powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -ArgumentList 'admin' -Verb RunAs"
        exit /b
    )
)

echo KutukDPI arka plan hizmeti kaldiriliyor...
sc stop "KutukDPI"
sc delete "KutukDPI"
sc stop "WinDivert" 2>nul
sc delete "WinDivert" 2>nul
sc stop "WinDivert14" 2>nul
sc delete "WinDivert14" 2>nul

echo.
echo Hizmet kaldirildi. KutukDPI artik arka planda calismiyor.
pause
