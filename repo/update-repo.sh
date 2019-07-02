#!/bin/bash

sudo apt update;sudo apt install -y reprepro dpkg-sig #xorriso fakeroot

chmod +x -v\
 apps/sources-repo/hud-menu/opt/hud-menu/*\
 apps/sources-repo/rauldipeas-repo/etc/rc.local\
 apps/sources-repo/wm-switcher/opt/wm-switcher/*

 find ./ -type d -exec chmod -v 755 {} \;
 find ./ -type f -name postinst -exec chmod -v 555 {} \;
 find ./ -type f -name preinst -exec chmod -v 555 {} \;
 find ./ -type f -name postrm -exec chmod -v 555 {} \;
 find ./ -type f -name prerm -exec chmod -v 555 {} \;

for bindir in $(find apps/sources-repo -type d -name bin); do chmod +x -v $bindir/* ; done

for debdir in $(find apps/sources-repo -type d -name DEBIAN); do chmod +x -v $debdir/p* ; done

ls repo/sources > repo/packages.list

for package in $(cat repo/packages.list); do dpkg-deb -b repo/sources/$package repo/packages/ ; done

cp -v repo/web-packages/* repo/packages/

bash repo/builds/resolve/build/resolve.sh

cp -v repo/builds/resolve/*.deb repo/packages/
#wget -cO repo/packages/davinci-resolve_16.0b4-1_amd64.deb https://www.dropbox.com/s/vqvn93tow2fh28g/davinci-resolve_16.0b4-1_amd64.deb?dl=1

cp -v repo/builds/gif-wallpaper/*.deb repo/packages/

cp -v repo/builds/gamemode/*.deb repo/packages/

cp -v repo/builds/snaptastic/*.deb repo/packages/

cp -v repo/builds/windowck/*.deb repo/packages/

find repo/packages -name '*.deb' -type f | xargs dpkg-sig --sign builder

find repo/packages -name '*.deb' -type f | xargs reprepro -P --ask-passphrase -Vb website/repo includedeb core
