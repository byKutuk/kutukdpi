@ECHO OFF
REM KutukDPI Windows hizmeti kurulumu (bilgisayar acilinca otomatik baslar)
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo KutukDPI hizmetini kurmak icin bu dosyayi yonetici olarak calistirin.
echo Sag tik - Yonetici Olarak Calistir.
echo Hazirsaniz herhangi bir tusa basin.
pause

sc stop "KutukDPI" 2>nul
sc delete "KutukDPI" 2>nul

sc create "KutukDPI" binPath= "\"%CD%\%_arch%\kutukdpi.exe\" -9 --blacklist \"%CD%\lists\discord.txt\" --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253" start= auto
sc description "KutukDPI" "Vodafone ve Turk ISP'lerde Discord DPI engelini atlatir."
sc start "KutukDPI"

echo.
echo KutukDPI hizmeti kuruldu ve baslatildi.
pause
POPD
