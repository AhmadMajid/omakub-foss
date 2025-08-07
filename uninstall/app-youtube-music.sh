#!/bin/bash
# Uninstall YouTube Music (unofficial)
set -e

sudo apt remove -y youtube-music || true
sudo apt purge -y youtube-music || true
sudo rm -f ~/.local/share/applications/youtube-music.desktop

echo "YouTube Music uninstalled!"
