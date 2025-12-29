#!/bin/bash
echo "Starting Zorin OS Post-Install Setup..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y tlp v4l-utils ffmpegthumbnailer