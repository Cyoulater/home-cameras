#!/bin/sh
# Start the camera app on a Mac or Linux computer:  ./start-mac-linux.sh
# Keep the window open while you use it. Press Ctrl+C to stop.
set -e
cd "$(dirname "$0")"
VERSION=v1.9.14
BASE="https://github.com/AlexxIT/go2rtc/releases/download/$VERSION"

if [ ! -x ./go2rtc ]; then
  echo "First run: downloading the camera engine (go2rtc $VERSION)..."
  OS=$(uname -s); ARCH=$(uname -m)
  case "$OS-$ARCH" in
    Darwin-arm64)   curl -fL -o go2rtc.zip "$BASE/go2rtc_mac_arm64.zip" && unzip -o go2rtc.zip go2rtc && rm go2rtc.zip ;;
    Darwin-x86_64)  curl -fL -o go2rtc.zip "$BASE/go2rtc_mac_amd64.zip" && unzip -o go2rtc.zip go2rtc && rm go2rtc.zip ;;
    Linux-x86_64)   curl -fL -o go2rtc "$BASE/go2rtc_linux_amd64" ;;
    Linux-aarch64)  curl -fL -o go2rtc "$BASE/go2rtc_linux_arm64" ;;
    Linux-armv7l)   curl -fL -o go2rtc "$BASE/go2rtc_linux_arm" ;;
    *) echo "Please download go2rtc for your computer from https://github.com/AlexxIT/go2rtc/releases/tag/$VERSION and put it in this folder as 'go2rtc'."; exit 1 ;;
  esac
  chmod +x go2rtc
fi

echo ""
echo "Camera app is starting. Open http://localhost:1984 in your browser."
echo "On your phone (same Wi-Fi), use this computer's address instead of localhost."
echo ""
exec ./go2rtc -config go2rtc.yaml
