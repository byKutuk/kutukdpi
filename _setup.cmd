@echo off
REM KutukDPI - dosya yollarini bul
set "KUTUK_ROOT=%~dp0"
cd /d "%KUTUK_ROOT%"

set "KUTUK_ARCH=x86_64"
if /i not "%PROCESSOR_ARCHITECTURE%"=="AMD64" if not defined PROCESSOR_ARCHITEW6432 set "KUTUK_ARCH=x86"

set "KUTUK_EXE="
if exist "%KUTUK_ROOT%x86_64\kutukdpi.exe" set "KUTUK_EXE=%KUTUK_ROOT%x86_64\kutukdpi.exe"
if not defined KUTUK_EXE if exist "%KUTUK_ROOT%%KUTUK_ARCH%\kutukdpi.exe" set "KUTUK_EXE=%KUTUK_ROOT%%KUTUK_ARCH%\kutukdpi.exe"
if not defined KUTUK_EXE if exist "%KUTUK_ROOT%release\x86_64\kutukdpi.exe" set "KUTUK_EXE=%KUTUK_ROOT%release\x86_64\kutukdpi.exe"
if not defined KUTUK_EXE if exist "%KUTUK_ROOT%release\%KUTUK_ARCH%\kutukdpi.exe" set "KUTUK_EXE=%KUTUK_ROOT%release\%KUTUK_ARCH%\kutukdpi.exe"

set "KUTUK_LIST="
if exist "%KUTUK_ROOT%lists\discord.txt" set "KUTUK_LIST=%KUTUK_ROOT%lists\discord.txt"
if not defined KUTUK_LIST if exist "%KUTUK_ROOT%release\lists\discord.txt" set "KUTUK_LIST=%KUTUK_ROOT%release\lists\discord.txt"

if not defined KUTUK_EXE (
    echo.
    echo [HATA] kutukdpi.exe bulunamadi!
    echo.
    echo ZIP dosyasini TAMAMEN ac. Su klasor yapisina benzemeli:
    echo   KutukDPI\x86_64\kutukdpi.exe
    echo   KutukDPI\lists\discord.txt
    echo   KutukDPI\BASLAT.cmd
    echo.
    echo Simdiki konum: %KUTUK_ROOT%
    dir /b "%KUTUK_ROOT%" 2>nul
    echo.
    pause
    exit /b 1
)

exit /b 0
