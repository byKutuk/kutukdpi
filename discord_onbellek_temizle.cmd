@echo off
echo Discord onbellegi temizleniyor...
echo Once Discord'u Gorev Yoneticisinden kapattigindan emin ol.
pause

taskkill /F /IM Discord.exe 2>nul
taskkill /F /IM Update.exe 2>nul

if exist "%APPDATA%\discord\Cache" rd /s /q "%APPDATA%\discord\Cache"
if exist "%APPDATA%\discord\Code Cache" rd /s /q "%APPDATA%\discord\Code Cache"
if exist "%APPDATA%\discord\GPUCache" rd /s /q "%APPDATA%\discord\GPUCache"
if exist "%APPDATA%\discord\Local Storage" rd /s /q "%APPDATA%\discord\Local Storage"

echo Temizlendi.
echo Simdi BASLAT_DISCORD_UYGULAMA.cmd veya BASLAT_TAM.cmd calistir, sonra Discord ac.
pause
