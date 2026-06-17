@echo off
if /i not "%~1"=="admin" (
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
    if errorlevel 1 (
        powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -ArgumentList 'admin' -Verb RunAs"
        exit /b
    )
)

call "%~dp0_setup.cmd"
if errorlevel 1 exit /b 1

sc stop "KutukDPI" 2>nul
sc delete "KutukDPI" 2>nul
sc create "KutukDPI" binPath= "\"%KUTUK_EXE%\" -9 --blacklist \"%KUTUK_LIST%\" --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253" start= auto
sc description "KutukDPI" "Vodafone ve Turk ISP'lerde Discord DPI engelini atlatir."
sc start "KutukDPI"
echo Hizmet kuruldu.
pause
