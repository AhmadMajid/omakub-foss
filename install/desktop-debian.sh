#!/bin/bash

# Desktop installation with Debian compatibility

. /etc/os-release

# Run desktop installers with OS detection
for installer in ~/.local/share/omakub/install/desktop/*.sh; do
  installer_name=$(basename "$installer")

  # Skip original files if Debian-specific versions exist and we're on Debian
  if [ "$ID" = "debian" ]; then
    case "$installer_name" in
      "set-app-grid.sh")
        source ~/.local/share/omakub/install/desktop/set-app-grid-debian.sh
        continue
        ;;
      "set-gnome-extensions.sh")
        source ~/.local/share/omakub/install/desktop/set-gnome-extensions-debian.sh
        continue
        ;;
    esac
  fi

  # Skip Debian-specific files when not on Debian
  case "$installer_name" in
    "set-app-grid-debian.sh"|"set-gnome-extensions-debian.sh")
      if [ "$ID" != "debian" ]; then
        continue
      fi
      ;;
  esac

  # Run installer for compatible apps
  source "$installer"
done

# Logout to pickup changes
if [ "$ID" = "debian" ]; then
  gum confirm "Ready to reboot for all settings to take effect? (Debian may require reboot instead of logout)" && sudo reboot
else
  gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
fi
