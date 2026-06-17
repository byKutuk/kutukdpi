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
echo Pencere acmana gerek kalmaz, bilgisayar her
echo acildiginda otomatik baslar.
echo.
echo ONEMLI: Bu klasoru tasima!
echo Konum: %KUTUK_ROOT%
echo.
pause

echo Eski hizmet kaldiriliyor...
sc stop "KutukDPI" 2>nul
sc delete "KutukDPI" 2>nul

echo Hizmet kuruluyor...
sc create "KutukDPI" binPath= "\"%KUTUK_EXE%\" -9 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253" start= auto
if errorlevel 1 (
    echo.
    echo [HATA] Hizmet kurulamadi.
    pause
    exit /b 1
)

sc description "KutukDPI" "Vodafone ve Turk ISP'lerde DPI engelini arka planda atlatir."
sc start "KutukDPI"

echo.
echo ============================================
echo   TAMAM! KutukDPI arka planda calisiyor.
echo ============================================
echo.
echo - Pencere yok, arka planda devam eder
echo - Bilgisayar her acildiginda otomatik baslar
echo - Discord'u normal acabilirsin
echo.
echo Kaldirmak icin: HIZMET_KALDIR.cmd
echo.
pause
