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
echo DNS onerisi: 1.1.1.1 ve 1.0.0.1 (Cloudflare)
echo.
pause

echo Eski hizmet kontrol ediliyor (ilk kurulumda uyari normaldir)...
sc query KutukProxy >nul 2>&1 && (sc stop KutukProxy >nul 2>&1 & sc delete KutukProxy >nul 2>&1)
sc query KutukDPI >nul 2>&1
if %errorlevel%==0 (
    sc stop "KutukDPI" >nul 2>&1
    sc delete "KutukDPI" >nul 2>&1
) else (
    echo Onceki hizmet yok, yeni kurulum yapiliyor...
)

REM Turkiye/Vodafone icin test edilmis mod (-5 + TTL + Cloudflare DNS)
sc create "KutukDPI" binPath= "\"%KUTUK_EXE%\" -5 --set-ttl 5 --dns-addr 1.1.1.1 --dns-port 53 --dnsv6-addr 2606:4700:4700::1111 --dnsv6-port 53" start= auto
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
