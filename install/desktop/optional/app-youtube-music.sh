#!/bin/bash

# Install YouTube Music (unofficial) via .deb from GitHub
set -e

# Get latest release download URL for amd64 .deb
YTMUSIC_URL=$(curl -s https://api.github.com/repos/th-ch/youtube-music/releases/latest | grep browser_download_url | grep 'amd64.deb' | cut -d '"' -f 4 | head -n 1)

if [ -z "$YTMUSIC_URL" ]; then
  echo "Could not find YouTube Music .deb download URL."
  exit 1
fi

wget "$YTMUSIC_URL" -O youtube-music-latest.deb
sudo apt install -y ./youtube-music-latest.deb
rm youtube-music-latest.deb

echo "YouTube Music installed!"
