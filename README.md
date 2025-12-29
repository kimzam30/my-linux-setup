# 🐧 Dell XPS 15 Linux Workstation (Zorin OS)

A comprehensive documentation of my Linux environment, hardware optimizations, and remote development workflow. 

![Zorin OS](https://img.shields.io/badge/OS-Zorin%20OS%2017-005C94?logo=zorin&logoColor=white)
![Kernel](https://img.shields.io/badge/Kernel-6.x-blue?logo=linux&logoColor=white)
![Device](https://img.shields.io/badge/Hardware-Dell%20XPS%2015%209500-D0202F?logo=dell&logoColor=white)

---

## 💻 Hardware Specifications
- **Model:** Dell XPS 15 9500
- **OS:** Zorin OS (Pro/Core) - Wayland Desktop
- **CPU:** Intel Core i7-10750H
- **Primary Use:** IT Student at Multimedia University (MMU) | Python & C++ Development

---

## 🛠️ System Optimizations & Fixes
*Documenting my solutions to common Linux hurdles.*

### 🌐 Browser (Opera One / GX)
**Issue:** Sidebar "Auto-hide" causing window manager crashes on Wayland.
**Solution:** Forced X11 compatibility layer via Ozone flags.
```bash
Fix command used in .desktop entry
opera --ozone-platform=x11 --enable-features=UseOzonePlatform
```
## 📷 Webcam Tuning
Issue: Default UVC drivers causing grainy/dark video on the XPS sensor. Tool: Guvcview & v4l-utils.

Primary Change: Disabled Auto-Exposure and set Power Line Frequency to 50Hz (Malaysia standard).

Profile: Saved as mmu_webcam_profile.gpfl in this repo.

## 📁 File Manager (Nautilus)
Enabled HEIF/HEIC thumbnail support via heif-thumbnailer.

Configured remote thumbnailing for NAS storage over Tailscale.

# 🎮 Remote Work & Gaming Workflow
How I stay connected between my home rig and campus.

### ⚡ Sunshine + Moonlight
Host: Windows 11 Gaming Rig running Sunshine.

Client: Zorin OS laptop running Moonlight-Qt (Flatpak).

Optimization: 1080p @ 60FPS (Balanced Bitrate) for zero-latency coding/gaming over university Wi-Fi.

### 🌐 Tailscale Mesh Network
The Setup: Connected all devices (Laptop, Gaming PC, NAS) into a secure private mesh.

Wake-on-LAN: Implemented WoL via my Always-On NAS acting as a bridge to wake the gaming PC remotely.

### 🐍 Development Stack
Languages: Python 3.x, C++ (GCC/Clang)

Environment: VS Code (Remote-SSH to NAS)

Networking: Tailscale for remote port forwarding.

### 🔋 Power Management (TLP)
**Status:** ✅ Optimized
- **Optimization:** Installed and configured `TLP` to handle aggressive power saving when on battery and maximum performance when plugged into AC.
- **Result:** Improved idle power draw on the XPS 15 9500 and managed thermal throttling more effectively.

```bash
# How to install on Zorin
sudo apt install tlp tlp-rdw
sudo tlp start
```
### 🚀 Installation & Quick Start
If I ever need to reinstall Zorin, these are the first commands I run:

```Bash
# Update and Install Essentials
sudo apt update && sudo apt upgrade -y
sudo apt install v4l-utils ffmpegthumbnailer heif-thumbnailer
```
### Install Moonlight & Flatpaks
flatpak install flathub com.moonlight_stream.Moonlight
# 📝 To-Do / Future Projects
[ ] Automate dotfile symlinking with a setup script.

[ ] Configure Rclone for MMU OneDrive integration.

[x] Optimize battery life using TLP or Power-profiles-daemon.