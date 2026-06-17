@echo off
setlocal enabledelayedexpansion
set "FOUND=0"
for /d %%D in ("%LOCALAPPDATA%\Discord\app-*") do (
    if exist "%%D\Discord.exe" (
        copy /Y "%KUTUK_DROVER_DLL%" "%%D\version.dll" >nul
        if exist "%KUTUK_ROOT%drover\d3d11.dll" copy /Y "%KUTUK_ROOT%drover\d3d11.dll" "%%D\d3d11.dll" >nul
        > "%%D\drover.ini" (
            echo [drover]
            echo proxy = socks5://127.0.0.1:1080
        )
        echo Discord drover kuruldu: %%D
        set "FOUND=1"
    )
)

if "!FOUND!"=="0" (
    echo.
    echo [UYARI] Discord kurulu degil veya klasor bulunamadi.
    echo Once Discord'u resmi siteden kur, sonra HIZMET_KUR.cmd tekrar calistir.
    echo.
)
endlocal
exit /b 0
