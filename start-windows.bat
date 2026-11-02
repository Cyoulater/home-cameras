@echo off
rem Double-click this file to start the camera app on Windows.
rem Keep this window open while you use it. Close it to stop.
cd /d "%~dp0"
set VERSION=v1.9.14

if not exist go2rtc.exe (
  echo First run: downloading the camera engine ^(go2rtc %VERSION%^)...
  powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://github.com/AlexxIT/go2rtc/releases/download/%VERSION%/go2rtc_win64.zip' -OutFile 'go2rtc.zip'; Expand-Archive -Force 'go2rtc.zip' '.'; Remove-Item 'go2rtc.zip'"
)

if not exist go2rtc.exe (
  echo.
  echo Could not download it. Please download go2rtc_win64.zip from
  echo https://github.com/AlexxIT/go2rtc/releases/tag/%VERSION%
  echo unzip it, and put go2rtc.exe in this folder. Then run this again.
  pause
  exit /b 1
)

echo.
echo Camera app is starting. Open this in your browser:
echo     http://localhost:1984
echo On your phone ^(same Wi-Fi^), use this computer's address instead of localhost.
echo.
start "" http://localhost:1984
go2rtc.exe -config go2rtc.yaml
pause
