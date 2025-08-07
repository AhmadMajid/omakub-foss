#!/bin/bash

# Display system information in the terminal
# Debian version - install from GitHub releases since PPA not available

. /etc/os-release

if [ "$ID" = "debian" ]; then
  # Install fastfetch from GitHub releases for Debian
  cd /tmp
  FASTFETCH_VERSION=$(curl -s https://api.github.com/repos/fastfetch-cli/fastfetch/releases/latest | grep -Po '"tag_name": "\K[^"]*')
  wget -O fastfetch.deb "https://github.com/fastfetch-cli/fastfetch/releases/download/${FASTFETCH_VERSION}/fastfetch-linux-amd64.deb"
  sudo apt install -y ./fastfetch.deb
  rm fastfetch.deb
  cd -
else
  # Ubuntu version - use PPA
  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
  sudo apt update -y
  sudo apt install -y fastfetch
fi

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use Omakub fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/omakub/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
