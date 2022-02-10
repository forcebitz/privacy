#!/bin/bash/

cd /usr/share/kservices5/ServiceMenus/;

cat > shred.desktop <<EOF
[Desktop Entry]
Type=Service
ServiceTypes=KonqPopupMenu/Plugin
MimeType=all/allfiles;
Actions=Shred
#X-KDE-Submenu=Shred

[Desktop Action Shred]
Name=Safe Remove
Icon=edit-delete-shred
Exec=/bin/bash -c 'kdialog --title "Safe Delete" --warningcontinuecancel "Safe Delete: Are you sure?" && shred -u -f -z -n3 %u'
EOF

cat > shred_folder.desktop <<EOF
[Desktop Entry]
Type=Service
ServiceTypes=KonqPopupMenu/Plugin
MimeType=inode/directory;
Actions=Shred
#X-KDE-Submenu=Shred

[Desktop Action Shred]
Name=Safe Folder Remove
Name[ru]=Удалить папку навсегда
Icon=trash-empty
Exec=find %u -type f -exec shred -u -f -z -n3 {} \;
#Exec=find %u -type f -exec notify-send {} '' \;
EOF

kquitapp5 plasmashell || killall plasmashell && kstart5 plasmashell
