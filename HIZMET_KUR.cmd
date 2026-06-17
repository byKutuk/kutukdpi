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
echo   KUTUKDPI - ARKA PLAN HIZMETI KURULUMU
echo ============================================
echo.
echo KutukDPI arka planda calisacak.
echo ONEMLI: Bu klasoru tasima!  %KUTUK_ROOT%
echo.
pause

sc stop "KutukDPI" 2>nul
sc delete "KutukDPI" 2>nul

REM Turkiye/Vodafone icin test edilmis mod (-5 + TTL + DNS)
sc create "KutukDPI" binPath= "\"%KUTUK_EXE%\" -5 --set-ttl 5 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253" start= auto
if errorlevel 1 (
    echo [HATA] Hizmet kurulamadi.
    pause
    exit /b 1
)

sc description "KutukDPI" "Vodafone ve Turk ISP'lerde DPI engelini arka planda atlatir."
sc start "KutukDPI"

echo.
echo KutukDPI arka planda calisiyor.
echo Discord uygulamasi acilmiyorsa DISCORD.txt dosyasina bak.
echo Kaldirmak icin: HIZMET_KALDIR.cmd
pause
