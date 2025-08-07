#!/bin/bash

# Run desktop installers
for installer in ~/.local/share/omakub/install/desktop/*.sh; do
  installer_name=$(basename "$installer")
  case "$installer_name" in
    "set-gnome-extensions.sh"|"set-gnome-extensions-debian.sh") continue ;;
    *) source $installer ;;
  esac
done

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot
