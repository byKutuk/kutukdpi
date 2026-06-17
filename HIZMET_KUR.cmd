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
echo   KUTUKDPI - DISCORD UYGULAMASI KURULUMU
echo ============================================
echo.
echo Discord.exe icin ByeDPI + drover kurulacak.
echo ONEMLI: Bu klasoru tasima!  %KUTUK_ROOT%
echo.
pause

echo Eski hizmetler kaldiriliyor...
sc query KutukProxy >nul 2>&1 && (sc stop KutukProxy >nul 2>&1 & sc delete KutukProxy >nul 2>&1)
sc query KutukDPI >nul 2>&1 && (sc stop KutukDPI >nul 2>&1 & sc delete KutukDPI >nul 2>&1)

echo.
echo [1/3] ByeDPI proxy hizmeti kuruluyor...
sc create KutukProxy binPath= "\"%KUTUK_BYEDPI%\" --port 1080 --disorder 1 --split 1+s" start= auto
sc description KutukProxy "KutukDPI Discord proxy (ByeDPI)"
sc start KutukProxy
if errorlevel 1 (
    echo [HATA] KutukProxy baslatilamadi.
    pause
    exit /b 1
)

echo.
echo [2/3] Discord uygulamasina drover kuruluyor...
call "%~dp0_discord_drover.cmd"

echo.
echo [3/3] Genel DPI hizmeti kuruluyor...
if defined KUTUK_EXE (
    sc create KutukDPI binPath= "\"%KUTUK_EXE%\" -f 2 -e 2 --wrong-seq --wrong-chksum --reverse-frag --max-payload --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253" start= auto
    sc description KutukDPI "KutukDPI genel DPI atlatma (GoodbyeDPI)"
    sc start KutukDPI
)

netsh advfirewall firewall add rule name="KutukDPI ByeDPI" dir=in action=allow program="%KUTUK_BYEDPI%" enable=yes >nul 2>&1

echo.
echo ============================================
echo   TAMAM!
echo ============================================
echo.
echo 1. Discord'u GOREV YONETICISINDEN kapat
echo 2. Discord'u tekrar ac
echo.
echo Hala acilmazsa: discord_temizle.cmd sonra tekrar HIZMET_KUR.cmd
echo.
pause
