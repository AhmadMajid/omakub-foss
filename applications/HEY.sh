#!/bin/bash

# Determine which browser to use (prefer Chrome for web apps, fallback to Firefox SSB if available, else default)
if command -v google-chrome >/dev/null 2>&1; then
  BROWSER_EXEC="google-chrome --app=\"https://app.hey.com/\" --name=HEY --class=HEY"
elif command -v firefox >/dev/null 2>&1; then
  BROWSER_EXEC="firefox --ssb https://app.hey.com/"
else
  BROWSER_EXEC="xdg-open https://app.hey.com/"
fi

cat <<EOF >~/.local/share/applications/HEY.desktop
[Desktop Entry]
Version=1.0
Name=HEY
Comment=HEY Email + Calendar
Exec=$BROWSER_EXEC
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/HEY.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
