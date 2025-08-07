#!/bin/bash

# Only ask for default desktop app choices when running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  OPTIONAL_APPS=("1password" "Spotify" "Zoom" "Dropbox" "Typora" "Basecamp" "HEY" "WhatsApp")
  DEFAULT_OPTIONAL_APPS=''
  CHOICE_RESULT=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 9 --header "Select optional apps" 2>/dev/null | tr ' ' '-')
  # Only export if gum succeeded and didn't return usage text
  if [[ $? -eq 0 && ! "$CHOICE_RESULT" =~ usage.*gum ]]; then
    export OMAKUB_FIRST_RUN_OPTIONAL_APPS="$CHOICE_RESULT"
  else
    export OMAKUB_FIRST_RUN_OPTIONAL_APPS=""
  fi
fi

AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
SELECTED_LANGUAGES="Ruby on Rails","Node.js"
export OMAKUB_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 10 --header "Select programming languages")

AVAILABLE_DBS=("MySQL" "Redis" "PostgreSQL")
SELECTED_DBS="MySQL,Redis"
export OMAKUB_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 5 --header "Select databases (runs in Docker)")
