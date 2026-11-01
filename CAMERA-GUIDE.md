# Camera guide: how to hook up each camera

Every camera brand talks a little differently. This page tells you what to look up for
each one and what line to put in `go2rtc.yaml` (or paste in **Settings** on the camera page).

## Before you start: fill this in for each camera

| | Camera 1 | Camera 2 | Camera 3 | Camera 4 |
|---|---|---|---|---|
| Brand and model number (sticker on the camera or recorder box) | Night Owl ... | Zmodo ... | | |
| Which phone app it uses (exact name) | | | | |
| Plugged into a recorder box, or Wi-Fi by itself? | | | | |
| Its address on your Wi-Fi (IP address, like 192.168.1.50) | | | | |
| Username and password | | | | |

**How to find the IP address:** open the camera's own app and look under the camera's
settings for "Device info", "Network" or "Wi-Fi info". Or log in to your Wi-Fi router
(often `192.168.1.1` or `192.168.0.1`) and look at the list of connected devices.

**Keep the address from changing:** in your router, find "DHCP reservation" or
"Address reservation" and reserve each camera's address. Otherwise a camera can get a
new address after a power cut, and its tile will stop working.

## The easy way first: "Add camera" can search for you

Open the camera page, press **Add camera**, and try these sections:

- **ONVIF**: finds most recorders and off-brand cameras that follow the common standard.
- **DVRIP**: finds cameras and recorders that use the **XMEye**, **iCSee** or **XMeye Pro** apps.
- **Tuya**: for cameras that use the **Tuya Smart** app.

When a camera shows up, copy its line, swap in the real username and password
(the search fills in `user:pass` as a placeholder), and save it under `streams:`.

## Night Owl

Night Owl sells two kinds of systems, and they work differently:

- **A recorder box (DVR/NVR) with cameras wired to it.** These usually allow local viewing.
  The username and password are the ones you use to log in on the recorder's own screen.
  The address is the recorder's address, not each camera's.
  On the recorder's screen, look under **Network** for its IP address and the "RTSP port"
  (usually 554). Some models have an "RTSP" or "ONVIF" switch there; turn it on.
- **Wi-Fi-only cameras with no recorder** (newer "Night Owl Protect" style). Many of these
  only work through Night Owl's cloud and cannot be viewed directly. Try ONVIF search anyway.

Lines to try for a recorder, one at a time, until one plays. Change `ch0` to `ch1`, `ch2` and so on
for the other cameras on the same recorder:

```yaml
night_owl_1: rtsp://admin:PASSWORD@192.168.1.50:554/ch0_0.264
night_owl_1: rtsp://admin:PASSWORD@192.168.1.50:554/Streaming/channels/101
night_owl_1: rtsp://admin:PASSWORD@192.168.1.50:554/cam/realmonitor?channel=1&subtype=0
night_owl_1: dvrip://admin:PASSWORD@192.168.1.50:34567?channel=0&subtype=0
```

## Zmodo

Honest heads-up: many newer Zmodo cameras (the ones using the **Zmodo** or **MeShare** app
for everything) only send video to Zmodo's cloud, and there is no way for any other app to
view them directly. Older Zmodo cameras and Zmodo recorder kits often do allow it, usually
on port **10554**.

Lines to try:

```yaml
zmodo: rtsp://admin:PASSWORD@192.168.1.51:10554/tcp/av0_0
zmodo: rtsp://admin:PASSWORD@192.168.1.51:554/tcp/av0_0
zmodo: rtsp://admin:PASSWORD@192.168.1.51:10554/udp/av0_0
zmodo: rtsp://admin:PASSWORD@192.168.1.51:10554/VideoInput/1/h264/1
```

If none of them play, that Zmodo is most likely cloud-only. Your options then are to keep
the Zmodo app for just that one, or swap it for an inexpensive camera that lists
"RTSP" or "ONVIF" on the box. Those plug straight into this app.

## Off-brand cameras

The fastest clue is **which phone app** the camera uses:

| App | What to do |
|---|---|
| **XMEye, iCSee, XMeye Pro** | Use **Add camera > DVRIP** search. Or: `dvrip://admin:PASSWORD@IP:34567?channel=0&subtype=0` |
| **Tuya Smart** | Use **Add camera > Tuya** and sign in. |
| **Smart Life** | Same as Tuya, but Smart Life logins don't work. Make a free **Tuya Smart** account, move the camera into the Tuya Smart app, then use **Add camera > Tuya**. |
| **Yoosee** | `rtsp://admin:PASSWORD@IP:554/onvif1` (the password is the "device password" set in the app) |
| **V380 / V380 Pro** | Turn on RTSP in the app's camera settings if offered, then `rtsp://admin:PASSWORD@IP:554/live/ch00_0` |
| **CloudEdge, others** | Look in the app's camera settings for "ONVIF" or "RTSP" and turn it on, then try **Add camera > ONVIF**. |
| Anything else | Try **Add camera > ONVIF** first. If the camera's manual or box mentions RTSP, the address is in there. |

## If a tile says it can't reach the camera

- "Username or password looks wrong": double-check them. Some cameras use a separate
  "device password" that differs from your app login.
- "It may be off, or its address changed": check the IP address again and reserve it in your router.
- Still stuck? Send the brand, model, app name and the exact message on the tile.
