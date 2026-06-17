@echo off
if /i not "%~1"=="admin" (
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
    if errorlevel 1 (
        echo Yonetici yetkisi isteniyor, lutfen Evet deyin...
        powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -ArgumentList 'admin' -Verb RunAs"
        exit /b
    )
)

call "%~dp0_setup.cmd"
if errorlevel 1 exit /b 1

echo ============================================
echo  TAM MOD - Discord acilmiyorsa bunu dene
echo  (tum trafik icin DPI atlatma)
echo ============================================
echo.
echo Once Discord'u GOREV YONETICISINDEN kapat.
echo Sonra bu pencereyi acik birak ve Discord'u tekrar ac.
echo.

start "KutukDPI" "%KUTUK_EXE%" -9 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253

echo KutukDPI TAM MOD calisiyor.
pause
