#!/bin/bash


# Determine which browser to use (prefer Chrome for web apps, fallback to Firefox SSB if available, else default)
if command -v google-chrome >/dev/null 2>&1; then
  BROWSER_EXEC="google-chrome --app=\"https://web.whatsapp.com\" --name=WhatsApp --class=Whatsapp"
elif command -v firefox >/dev/null 2>&1; then
  # Use Firefox site-specific browser mode if available (FF 117+)
  BROWSER_EXEC="firefox --ssb https://web.whatsapp.com"
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
