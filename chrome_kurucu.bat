@echo off
title Windows 7 Tarayıcı Kurulum Aracı
color 0A
echo ======================================================
echo  Windows 7 - 32/64-bit Tarayici Kurulum
echo ======================================================
echo.

:: Sistem mimarisini tespit et
set ARCH=32
if exist "%SystemRoot%\SysWOW64" set ARCH=64
echo Sistem mimarisi tespit edildi: %ARCH%-bit
echo.

:: Kullanıcıya seçenekleri sun
echo Lütfen kurmak istedigin tarayiciyi secin:
echo 1. Mypal 78
echo 2. Brave 1.47
echo 3. Pale Moon
echo 4. Opera
echo 5. Vivaldi
echo 6. Waterfox
set /p choice="Seciminiz (1-6): "

:: İndirilecek URL ve isimleri belirle
if "%choice%"=="1" (
    if "%ARCH%"=="64" (
        set URL=https://www.mypal-browser.org/release/mypal-29.3.0.win64.installer.exe
    ) else (
        set URL=https://www.mypal-browser.org/release/mypal-29.3.0.win32.installer.exe
    )
    set NAME=mypal_setup.exe
)
if "%choice%"=="2" (
    if "%ARCH%"=="64" (
        set URL=https://download.filepuma.com/files/browsers-and-plugins/brave-browser-64bit-/Brave_browser_(64bit)_v1.47.186.exe
    ) else (
        set URL=https://download.filepuma.com/files/web-browsers/brave-browser-32bit-/Brave_browser_(32bit)_v1.47.186.exe
    )
    set NAME=brave_setup.exe
)
if "%choice%"=="3" (
    if "%ARCH%"=="64" (
        set URL=https://rm-eu.palemoon.org/release/palemoon-33.9.0.1.win64.installer.exe
    ) else (
        set URL=https://rm-eu.palemoon.org/release/palemoon-33.9.0.1.win32.installer.exe
    )
    set NAME=palemoon_setup.exe
)
if "%choice%"=="4" (
    if "%ARCH%"=="64" (
        set URL=https://download5.operacdn.com/ftp/pub/opera/desktop/122.0.5643.142/win/Opera_122.0.5643.142_Setup_x64.exe
    ) else (
        set URL=https://download5.operacdn.com/ftp/pub/opera/desktop/122.0.5643.142/win/Opera_122.0.5643.142_Setup.exe
    )
    set NAME=opera_setup.exe
)
if "%choice%"=="5" (
    if "%ARCH%"=="64" (
        set URL=https://downloads.vivaldi.com/stable/Vivaldi.6.1.3035.44.x64.exe
    ) else (
        set URL=https://downloads.vivaldi.com/stable/Vivaldi.6.1.3035.44.exe
    )
    set NAME=vivaldi_setup.exe
)
if "%choice%"=="6" (
    if "%ARCH%"=="64" (
        set URL=https://cdn1.waterfox.net/waterfox/releases/G6.0.20/WINNT_x86_64/Waterfox%20Setup%20G6.0.20.exe
    ) else (
        set URL=https://cdn1.waterfox.net/waterfox/releases/G6.0.20/WINNT_x86_64/Waterfox%20Setup%20G6.0.20.exe
    )
    set NAME=waterfox_setup.exe
)
:: Dosyayı indir
echo %NAME% indiriliyor...
powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile $env:TEMP\%NAME%"

:: Kurulum
echo Kurulum baslatiliyor...
start /wait "" "%TEMP%\%NAME%" /silent /install

echo.
echo Kurulum tamamlandi!
echo.
pause
exit
