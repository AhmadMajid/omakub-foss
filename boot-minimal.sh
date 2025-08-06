#!/bin/bash

# Omakub Minimal - Privacy-focused, subscription-free Ubuntu setup
#
# This is a customized fork of Omakub that provides a truly minimal installation
# by making all proprietary and subscription-based software optional.
#
# Key differences from upstream Omakub:
# - No optional apps selected by default (1Password, Spotify, Zoom removed from defaults)
# - Typora, Basecamp, and HEY moved to optional selection
# - Privacy-focused: no forced proprietary software installation
# - All apps still available but require explicit user selection
#
# Usage:
# wget -qO- https://raw.githubusercontent.com/YOUR_USERNAME/omakub/master/boot.sh | bash

set -e

ascii_art='
    ____  __  ______    __ ____  ______     __  ___ ___   ___   _____ __  ___ ___    __
   / __ \/  |/  /   |  / //_/ / / / __ )   /  |/  //   | / / | /  /  /  |/   |  |  / /
  / / / / /|_/ / /| | / ,< / / / / __  |  / /|_/ // /| |/ /  |/ / / / /|_/ /| ||  | / /
 / /_/ / /  / / ___ |/ /| / /_/ / /_/ /  / /  / // ___ / / /|  / / / /  / / ___ || |/ /
 \____/_/  /_/_/  |_/_/ |_\____/_____/  /_/  /_//_/  |_/_/ |_/ /_/ /_/  /_/_/  |_||___/

'

echo "$ascii_art"
echo "=> Omakub Minimal: Privacy-focused Ubuntu development setup"
echo "=> Downloading and installing..."

if [ -d "$HOME/.local/share/omakub" ]; then
  echo "=> Omakub is already installed. Remove ~/.local/share/omakub to reinstall."
  exit 1
fi

mkdir -p ~/.local/share
git clone https://github.com/YOUR_USERNAME/omakub.git ~/.local/share/omakub >/dev/null
echo "export OMAKUB_PATH=$HOME/.local/share/omakub" >>~/.bashrc
export OMAKUB_PATH="$HOME/.local/share/omakub"

source ~/.local/share/omakub/install.sh
