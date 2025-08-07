#!/bin/bash


# Install Pinta via Flatpak (recommended alternative to Snap)
if command -v flatpak >/dev/null 2>&1; then
  flatpak install -y flathub com.github.PintaProject.Pinta
else
  echo "Flatpak is not installed. Please install Flatpak or install Pinta via your package manager."
fi
