#!/bin/bash

sudo apt install python3-tk desktop-file-utils

chmod +x ./argus
mkdir -p ${HOME}/.local/bin
cp ./argus ${HOME}/.local/bin/argus

mkdir -p ${HOME}/.local/share/icons/hicolor/scalable/apps
cp ./argus.svg ${HOME}/.local/share/icons/hicolor/scalable/apps/
gtk-update-icon-cache "${HOME}/.local/share/icons/hicolor" >/dev/null 2>&1 || true

mkdir -p ${HOME}/.local/share/applications
cat > "${HOME}/.local/share/applications/argus.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Argus
Comment=Image viewer
Exec=${HOME}/.local/bin/argus %F
TryExec=${HOME}/.local/bin/argus
Icon=argus
Terminal=false
Categories=Graphics;Viewer;
MimeType=image/png;image/jpeg;image/gif;
StartupNotify=true
EOF

update-desktop-database "${HOME}/.local/share/applications"
