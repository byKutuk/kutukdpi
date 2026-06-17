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
taskkill /F /IM goodbyedpi.exe 2>nul
sc stop "KutukDPI" 2>nul
sc delete "KutukDPI" 2>nul
sc stop "WinDivert" 2>nul
sc delete "WinDivert" 2>nul
sc stop "WinDivert14" 2>nul
sc delete "WinDivert14" 2>nul

echo.
echo KutukDPI tamamen kaldirildi.
echo Not: Tarayicida Discord acilmasi normal - Chrome/Edge
echo kendi DNS kullanir, KutukDPI'ye bagli degildir.
pause
