#!/bin/bash

# Install core applications (always installed)
for script in ~/.local/share/omakub/applications/*.sh; do
  # Skip Basecamp, HEY, and WhatsApp - they're handled as optional apps
  case "$(basename "$script")" in
    "Basecamp.sh"|"HEY.sh"|"WhatsApp.sh") continue ;;
    *) source "$script" ;;
  esac
done
