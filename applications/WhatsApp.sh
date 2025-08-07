#!/bin/bash

# Determine which browser to use (prefer Chrome for web apps, fallback to default)
if command -v google-chrome >/dev/null 2>&1; then
  BROWSER_EXEC="google-chrome --app="https://web.whatsapp.com" --name=WhatsApp --class=Whatsapp"
else
  BROWSER_EXEC="xdg-open https://web.whatsapp.com"
fi

cat <<EOF >~/.local/share/applications/WhatsApp.desktop
[Desktop Entry]
Version=1.0
Name=WhatsApp
Comment=WhatsApp Messenger
Exec=$BROWSER_EXEC
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/WhatsApp.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
