#!/bin/bash

# Omakub FOSS Universal Boot Script
#
# This version supports both Ubuntu 24.04+ and Debian 12+
# Automatically detects the OS and uses appropriate installation methods

set -e

ascii_art='
    ____  __  ______    __ ____  ______     ____  __________ ____
   / __ \/  |/  /   |  / //_/ / / / __ )   / __ \/ ____/ __ / __ \
  / / / / /|_/ / /| | / ,< / / / / __  |  / / / / __/ / /_/ / / / /
 / /_/ / /  / / ___ |/ /| / /_/ / /_/ /  / /_/ / /___/ __, / /_/ /
 \____/_/  /_/_/  |_/_/ |_\____/_____/  /_____/_____/____/_____/

'

echo "$ascii_art"
echo "=> Omakub FOSS: Privacy-focused Ubuntu/Debian development setup"

# Detect OS early
if [ -f /etc/os-release ]; then
  . /etc/os-release
  echo "=> Detected: $ID $VERSION_ID"

  if [ "$ID" = "ubuntu" ]; then
    echo "=> Using Ubuntu-optimized installation"
  elif [ "$ID" = "debian" ]; then
    echo "=> Using Debian-compatible installation"
    echo "   Note: Some features may be limited on Debian"
  else
    echo "=> Error: Unsupported OS"
    echo "   This installer supports Ubuntu 24.04+ and Debian 12+ only"
    exit 1
  fi
else
  echo "=> Error: Cannot detect OS"
  exit 1
fi

echo "=> Downloading and installing..."

# Ensure git is installed before proceeding
if ! command -v git >/dev/null 2>&1; then
  echo "=> Installing git..."
  sudo apt update && sudo apt install -y git
fi

if [ -d "$HOME/.local/share/omakub" ]; then
  echo "=> Omakub is already installed. Remove ~/.local/share/omakub to reinstall."
  exit 1
fi

mkdir -p ~/.local/share
git clone https://github.com/AhmadMajid/omakub-foss.git ~/.local/share/omakub >/dev/null
echo "export OMAKUB_PATH=$HOME/.local/share/omakub" >>~/.bashrc
export OMAKUB_PATH="$HOME/.local/share/omakub"

# Use universal installer with OS detection
source ~/.local/share/omakub/install-debian.sh
