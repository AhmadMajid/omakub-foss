#!/bin/bash

# Install core applications (always installed)
for script in ~/.local/share/omakub/applications/*.sh; do
  # Skip Basecamp and HEY - they're handled as optional apps
  case "$(basename "$script")" in
    "Basecamp.sh"|"HEY.sh") continue ;;
    *) source "$script" ;;
  esac
done
