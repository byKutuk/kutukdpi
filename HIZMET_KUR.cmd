@echo off
title KutukDPI Turkiye - ISP Secimi
cls
echo ============================================
echo   KUTUKDPI TURKIYE - INTERNET SEC
echo ============================================
echo.
echo Hangi internet saglayiciyi kullaniyorsun?
echo.
echo   1  Genel Turkiye      (cogu ISP, onerilen)
echo   2  Cloudflare DNS     (1.1.1.1 ayarliysan)
echo   3  Vodafone
echo   4  Vodafone + Discord hedefli mod
echo   5  TurkNet
echo   6  TTNet / Turk Telekom
echo   7  Turkcell Superonline  (alt menu)
echo.
set /p SECIM="Secimin (1-7): "

if "%SECIM%"=="1" call "%~dp0_hizmet_install.cmd" turkiye.cmd & exit /b
if "%SECIM%"=="2" call "%~dp0_hizmet_install.cmd" cloudflare.cmd & exit /b
if "%SECIM%"=="3" call "%~dp0_hizmet_install.cmd" vodafone.cmd & exit /b
if "%SECIM%"=="4" call "%~dp0_hizmet_install.cmd" vodafone_discord.cmd & exit /b
if "%SECIM%"=="5" call "%~dp0_hizmet_install.cmd" turknet.cmd & exit /b
if "%SECIM%"=="6" call "%~dp0_hizmet_install.cmd" ttnet.cmd & exit /b
if "%SECIM%"=="7" goto superonline

echo Gecersiz secim.
pause
exit /b 1

:superonline
cls
echo ============================================
echo   TURKCELL SUPERONLINE MODLARI
echo ============================================
echo.
echo   1  TTL modu           (DNS'i elle ayarla)
echo   2  -5 modu            (DNS'i elle ayarla)
echo   3  TTL + Yandex DNS
echo   4  -5 + Yandex DNS    (Discord update failed icin)
echo   5  -9 + Yandex DNS
echo   6  -9 modu            (DNS'i elle ayarla)
echo.
set /p SO="Superonline modu (1-6): "

if "%SO%"=="1" call "%~dp0_hizmet_install.cmd" superonline_1.cmd & exit /b
if "%SO%"=="2" call "%~dp0_hizmet_install.cmd" superonline_2.cmd & exit /b
if "%SO%"=="3" call "%~dp0_hizmet_install.cmd" superonline_3.cmd & exit /b
if "%SO%"=="4" call "%~dp0_hizmet_install.cmd" superonline_4.cmd & exit /b
if "%SO%"=="5" call "%~dp0_hizmet_install.cmd" superonline_5.cmd & exit /b
if "%SO%"=="6" call "%~dp0_hizmet_install.cmd" superonline_6.cmd & exit /b

echo Gecersiz secim.
pause
exit /b 1
