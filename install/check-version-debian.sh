#!/bin/bash

if [ ! -f /etc/os-release ]; then
  echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
  echo "Installation stopped."
  exit 1
fi

. /etc/os-release

# Check if running on Ubuntu 24.04+ or Debian 12+
if [ "$ID" = "ubuntu" ]; then
  if [ $(echo "$VERSION_ID >= 24.04" | bc) != 1 ]; then
    echo "$(tput setaf 1)Error: Ubuntu version requirement not met"
    echo "You are currently running: $ID $VERSION_ID"
    echo "Ubuntu required: 24.04 or higher"
    echo "Installation stopped."
    exit 1
  fi
elif [ "$ID" = "debian" ]; then
  if [ $(echo "$VERSION_ID >= 12" | bc) != 1 ]; then
    echo "$(tput setaf 1)Error: Debian version requirement not met"
    echo "You are currently running: $ID $VERSION_ID"
    echo "Debian required: 12 (Bookworm) or higher"
    echo "Installation stopped."
    exit 1
  fi
else
  echo "$(tput setaf 1)Error: OS requirement not met"
  echo "You are currently running: $ID $VERSION_ID"
  echo "OS required: Ubuntu 24.04+ or Debian 12+"
  echo "Installation stopped."
  exit 1
fi

# Check if running on x86
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ]; then
  echo "$(tput setaf 1)Error: Architecture requirement not met"
  echo "You are currently running: $ARCH"
  echo "Architecture required: x86_64"
  echo "Installation stopped."
  exit 1
fi
