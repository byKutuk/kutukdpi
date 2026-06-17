@echo off
set "KUTUK_ROOT=%~dp0"
cd /d "%KUTUK_ROOT%"

set "KUTUK_ARCH=x86_64"
if /i not "%PROCESSOR_ARCHITECTURE%"=="AMD64" if not defined PROCESSOR_ARCHITEW6432 set "KUTUK_ARCH=x86"

set "KUTUK_EXE="
if exist "%KUTUK_ROOT%x86_64\kutukdpi.exe" set "KUTUK_EXE=%KUTUK_ROOT%x86_64\kutukdpi.exe"
if not defined KUTUK_EXE if exist "%KUTUK_ROOT%%KUTUK_ARCH%\kutukdpi.exe" set "KUTUK_EXE=%KUTUK_ROOT%%KUTUK_ARCH%\kutukdpi.exe"

set "KUTUK_BYEDPI="
if exist "%KUTUK_ROOT%byedpi\ciadpi.exe" set "KUTUK_BYEDPI=%KUTUK_ROOT%byedpi\ciadpi.exe"

set "KUTUK_DROVER_DLL="
if exist "%KUTUK_ROOT%drover\version.dll" set "KUTUK_DROVER_DLL=%KUTUK_ROOT%drover\version.dll"

if not defined KUTUK_BYEDPI (
    echo.
    echo [HATA] byedpi\ciadpi.exe bulunamadi!
    echo ZIP dosyasini tamamen ac.
    pause
    exit /b 1
)

exit /b 0
