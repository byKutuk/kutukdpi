@echo off
echo Discord kapatiliyor ve onbellek temizleniyor...
taskkill /F /IM Discord.exe 2>nul
taskkill /F /IM Update.exe 2>nul
timeout /t 2 /nobreak >nul
if exist "%APPDATA%\discord\Cache" rd /s /q "%APPDATA%\discord\Cache"
if exist "%APPDATA%\discord\Code Cache" rd /s /q "%APPDATA%\discord\Code Cache"
if exist "%APPDATA%\discord\GPUCache" rd /s /q "%APPDATA%\discord\GPUCache"
echo Tamam. Simdi HIZMET_KUR.cmd calistir, sonra Discord ac.
pause
