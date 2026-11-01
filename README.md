# Home Cameras

One web page that shows every camera in the house as a grid of live tiles, whatever brand
it is. Tap a tile to blow it up; tap **All cameras** to go back.

It runs on a computer at home (an always-on PC, laptop, mini PC or Raspberry Pi) and talks to
each camera directly over your Wi-Fi. Any phone, tablet or computer on the same Wi-Fi can then
open the page. Nothing is sent to an outside company.

Under the hood it uses [go2rtc](https://github.com/AlexxIT/go2rtc), a free program that knows how
to talk to most camera brands, plus a simple camera-grid page made for this project.

## Setup (Windows)

1. On this page, click the green **Code** button, then **Download ZIP**. Unzip it somewhere
   like `Documents\home-cameras`.
2. Double-click **start-windows.bat**. The first time, it downloads the camera engine.
   If Windows asks whether to allow network access, choose **Allow** (private networks).
3. Your browser opens to `http://localhost:1984`. You'll see "No cameras yet".
4. Add your cameras: follow **[CAMERA-GUIDE.md](CAMERA-GUIDE.md)**. You can paste camera lines in
   **Settings** on the page, then press **Save & Restart**.
5. Keep the black window open. Closing it stops the camera page.

## Setup (Mac or Linux)

Same as above, but open Terminal in the folder and run `./start-mac-linux.sh`.

## Setup (Docker, for a Raspberry Pi or home server)

```sh
docker compose up -d
```

## Seeing it on your phone

Find the home computer's address (Windows: open Command Prompt and type `ipconfig`, look for
"IPv4 Address", for example `192.168.1.20`). On your phone, connected to the same Wi-Fi, open
`http://192.168.1.20:1984`. Then use your browser's **Add to Home Screen** so it opens like an app.

## Keeping it private

- The page works only on your home Wi-Fi. Don't set up "port forwarding" for it on your router.
- To add a login to the page, open `go2rtc.yaml` and fill in the `username` and `password` lines
  under `api:` (remove the `#` in front of them).
- To see cameras while away from home, the safe way is a private network app such as Tailscale.
  That's a later step.

## What's in here

| File | What it is |
|---|---|
| `go2rtc.yaml` | Your list of cameras, with examples for each brand |
| `CAMERA-GUIDE.md` | What to look up for each camera and what to type |
| `web/index.html` | The camera grid page |
| `web/` (other files) | go2rtc's own pages (add camera, settings, logs), MIT license, from go2rtc v1.9.14 |
| `start-windows.bat`, `start-mac-linux.sh` | Double-click starters that download go2rtc v1.9.14 the first time |
| `docker-compose.yml` | Same thing for Docker |

If you update go2rtc to a newer version, also update the files in `web/` from that version
(everything except `index.html`), so the pages and the engine match.
