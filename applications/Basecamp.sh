#!/bin/bash

# Determine which browser to use (prefer Chrome for web apps, fallback to Firefox SSB if available, else default)
if command -v google-chrome >/dev/null 2>&1; then
  BROWSER_EXEC="google-chrome --app=\"https://launchpad.37signals.com\" --name=Basecamp --class=Basecamp"
elif command -v firefox >/dev/null 2>&1; then
  BROWSER_EXEC="firefox --ssb https://launchpad.37signals.com"
else
  BROWSER_EXEC="xdg-open https://launchpad.37signals.com"
fi

cat <<EOF >~/.local/share/applications/Basecamp.desktop
[Desktop Entry]
Version=1.0
Name=Basecamp
Comment=Basecamp Project Management
Exec=$BROWSER_EXEC
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/Basecamp.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
