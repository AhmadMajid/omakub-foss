#!/bin/bash

# Omakub FOSS Debian-Compatible Installation
# Automatically detects Ubuntu vs Debian and uses appropriate scripts

set -e

# Detect OS
. /etc/os-release

echo "Detected OS: $ID $VERSION_ID"

if [ "$ID" = "ubuntu" ]; then
  echo "Using Ubuntu-optimized installation..."
  # Use original check-version script
  source ~/.local/share/omakub/install/check-version.sh
elif [ "$ID" = "debian" ]; then
  echo "Using Debian-compatible installation..."
  # Use Debian-compatible check-version script
  source ~/.local/share/omakub/install/check-version-debian.sh
else
  echo "Unsupported OS: $ID"
  echo "This installer supports Ubuntu 24.04+ and Debian 12+ only."
  exit 1
fi

# Ask for app choices
echo "Get ready to make a few choices..."
source ~/.local/share/omakub/install/terminal/required/app-gum.sh >/dev/null
source ~/.local/share/omakub/install/first-run-choices.sh
source ~/.local/share/omakub/install/identification.sh

# Desktop software and tweaks will only be installed if we're running Gnome (or if desktop environment is unknown)
if [[ -z "$XDG_CURRENT_DESKTOP" ]] || [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Installing terminal and desktop tools..."

  # Install terminal tools (OS-specific)
  source ~/.local/share/omakub/install/terminal-debian.sh

  # Install desktop tools (OS-specific)
  source ~/.local/share/omakub/install/desktop-debian.sh

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo "Only installing terminal tools..."
  source ~/.local/share/omakub/install/terminal-debian.sh
fi

echo ""
echo "Omakub FOSS installation completed successfully!"
echo ""
if [ "$ID" = "debian" ]; then
  echo "Note: Some Ubuntu-specific features may not be available on Debian."
  echo "See installation log for any compatibility notes."
fi
