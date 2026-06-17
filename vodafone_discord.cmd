@ECHO OFF
REM KutukDPI - Vodafone icin Discord DPI atlatma (onerilen mod)
REM Yonetici olarak calistirin. Pencere kapaninca program durur.
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)
PUSHD "%_arch%"

start "" kutukdpi.exe -9 --blacklist "..\lists\discord.txt" --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253

POPD
POPD
