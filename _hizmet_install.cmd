@echo off
setlocal
set "PROFIL_DOSYA=%~1"
if not defined PROFIL_DOSYA (
    echo [HATA] Profil belirtilmedi.
    exit /b 1
)

if /i not "%~2"=="admin" (
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
    if errorlevel 1 (
        powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -ArgumentList '%PROFIL_DOSYA% admin' -Verb RunAs"
        exit /b
    )
)

call "%~dp0_setup.cmd"
if errorlevel 1 exit /b 1

if not exist "%~dp0profiller\%PROFIL_DOSYA%" (
    echo [HATA] Profil bulunamadi: %PROFIL_DOSYA%
    pause
    exit /b 1
)

call "%~dp0profiller\%PROFIL_DOSYA%"
set "KUTUK_BIN_ARGS=%KUTUK_ARGS%"

if defined KUTUK_USE_BLACKLIST (
    if not exist "%KUTUK_ROOT%lists\discord.txt" (
        echo [HATA] lists\discord.txt bulunamadi!
        pause
        exit /b 1
    )
    set "KUTUK_BIN_ARGS=%KUTUK_BIN_ARGS% --blacklist \"%KUTUK_ROOT%lists\discord.txt\""
)

echo ============================================
echo   KUTUKDPI - %KUTUK_PROFIL%
echo ============================================
echo.
echo ONEMLI: Bu klasoru tasima!  %KUTUK_ROOT%
echo %KUTUK_DNS_NOTU%
echo.
pause

sc query KutukProxy >nul 2>&1 && (sc stop KutukProxy >nul 2>&1 & sc delete KutukProxy >nul 2>&1)
sc query KutukDPI >nul 2>&1 && (sc stop KutukDPI >nul 2>&1 & sc delete KutukDPI >nul 2>&1)

sc create KutukDPI binPath= "\"%KUTUK_EXE%\" %KUTUK_BIN_ARGS%" start= auto
if errorlevel 1 (
    echo [HATA] Hizmet kurulamadi.
    pause
    exit /b 1
)

sc description KutukDPI "KutukDPI - %KUTUK_PROFIL%"
sc start KutukDPI

> "%KUTUK_ROOT%profil.txt" (
    echo %KUTUK_PROFIL%
    echo %PROFIL_DOSYA%
)

echo.
echo Kuruldu: %KUTUK_PROFIL%
echo Profil degistirmek icin HIZMET_KUR.cmd tekrar calistir.
echo Kaldirmak icin: HIZMET_KALDIR.cmd
echo.
pause
endlocal
exit /b 0
