#!/bin/bash

# Terminal installation with Debian compatibility

. /etc/os-release

# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

# Run terminal installers with OS detection
for installer in ~/.local/share/omakub/install/terminal/*.sh; do
  installer_name=$(basename "$installer")

  # Skip original files if Debian-specific versions exist
  if [ "$ID" = "debian" ]; then
    case "$installer_name" in
      "app-fastfetch.sh")
        source ~/.local/share/omakub/install/terminal/app-fastfetch-debian.sh
        continue
        ;;
      "docker.sh")
        source ~/.local/share/omakub/install/terminal/docker-debian.sh
        continue
        ;;
    esac
  fi

  # Run original installer for compatible apps
  source "$installer"
done
