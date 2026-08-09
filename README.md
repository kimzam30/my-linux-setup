# My Linux Setup

Working notes for a Dell XPS 15 running Zorin OS — the hardware fixes that were not obvious, the power tuning that actually moved the needle, and the remote workflow that connects the laptop to a home server.

![Zorin OS](https://img.shields.io/badge/Zorin_OS_17-005C94?style=flat-square&logo=zorin&logoColor=white)
![Hardware](https://img.shields.io/badge/Dell_XPS_15_9500-D0202F?style=flat-square&logo=dell&logoColor=white)
![Tailscale](https://img.shields.io/badge/Tailscale-18181B?style=flat-square&logo=tailscale&logoColor=white)
![License](https://img.shields.io/github/license/kimzam30/my-linux-setup?style=flat-square)

---

## The machine

| | |
|---|---|
| Model | Dell XPS 15 9500 |
| CPU | Intel Core i7-10750H |
| OS | Zorin OS 17, Wayland session |
| Used for | Python and C++ coursework, remote development |

---

## Fixes

### Opera crashes on Wayland

**Symptom** — enabling sidebar auto-hide crashed the window manager.

**Cause** — Opera's Wayland/Ozone path mishandles the sidebar's popup surface.

**Fix** — force the X11 backend in the `.desktop` entry:

```bash
opera --ozone-platform=x11 --enable-features=UseOzonePlatform
```

### Grainy webcam

**Symptom** — dark, noisy video from the XPS sensor under default UVC settings.

**Fix** — disable auto-exposure and set the power line frequency to 50 Hz (Malaysia's mains frequency; leaving it at 60 Hz causes visible flicker banding). Tuned with `guvcview` and `v4l-utils`; the resulting control dump is in [`configs/video0.txt`](configs/video0.txt).

```bash
sudo apt install v4l-utils guvcview
v4l2-ctl --list-ctrls          # inspect current values
```

### HEIC thumbnails in Nautilus

Install `heif-thumbnailer` so iPhone photos preview instead of showing generic icons. Also configured for remote thumbnailing against NAS storage over Tailscale.

```bash
sudo apt install heif-thumbnailer ffmpegthumbnailer
```

### Battery life (TLP)

Aggressive power saving on battery, full performance on AC. Noticeably lower idle draw and better thermal behaviour under sustained load. Full configuration in [`configs/tlpconfig.txt`](configs/tlpconfig.txt).

```bash
sudo apt install tlp tlp-rdw
sudo tlp start
```

### Desktop tweaks

- Fractional scaling at 125%
- Touchpad gestures via `libinput-gestures`

---

## Remote workflow

### Tailscale mesh

Laptop, gaming desktop, and NAS all sit on one private tailnet. No port forwarding, no dynamic DNS. The always-on NAS doubles as a Wake-on-LAN bridge to power up the desktop remotely.

### Game and desktop streaming

| | |
|---|---|
| Host | Windows 11 desktop running Sunshine |
| Client | Zorin laptop running Moonlight-Qt (Flatpak) |
| Settings | 1080p @ 60 fps, balanced bitrate — usable over campus Wi-Fi |

```bash
flatpak install flathub com.moonlight_stream.Moonlight
```

### Development

VS Code over Remote-SSH into the NAS, so heavy builds run on the server and the laptop stays cool and quiet.

---

## Repository contents

```
my-linux-setup/
├── configs/
│   ├── bashrc.txt        # Shell aliases and prompt
│   ├── tlpconfig.txt     # Full TLP power configuration
│   └── video0.txt        # Webcam control values
├── scripts/
│   └── setup.sh          # Post-install package bootstrap
└── assets/
```

---

## Fresh install bootstrap

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install v4l-utils ffmpegthumbnailer heif-thumbnailer tlp tlp-rdw
flatpak install flathub com.moonlight_stream.Moonlight
```

---

## To do

- [x] Optimise battery life with TLP
- [ ] Automate dotfile symlinking from `scripts/setup.sh`
- [ ] Configure Rclone for university OneDrive

---

## License

MIT — see [LICENSE](LICENSE).
