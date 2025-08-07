#!/bin/bash

# Ask for default desktop app choices unless we're in a headless environment
# This covers GNOME, Unity, KDE, and other desktop environments
if [[ -n "$DISPLAY" ]] || [[ -n "$WAYLAND_DISPLAY" ]] || [[ -z "$XDG_CURRENT_DESKTOP" ]] || [[ "$XDG_CURRENT_DESKTOP" != "none" ]]; then
  OPTIONAL_APPS=("1password" "Basecamp" "Chrome" "Dropbox" "HEY" "Obsidian" "Spotify" "Typora" "VSCode" "WhatsApp" "Zoom")
  export OMAKUB_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --height 12 --header "Select optional apps" | tr ' ' '-')
fi

AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
SELECTED_LANGUAGES="Ruby on Rails","Node.js"
export OMAKUB_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")

AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
SELECTED_DBS="MySQL,Redis"
export OMAKUB_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")
