#!/bin/bash

sudo apt update;sudo apt install -y reprepro dpkg-sig

chmod +x -v\
 apps/sources-repo/hud-menu/opt/hud-menu/*\
 apps/sources-repo/rauldipeas-repo/etc/rc.local\
 apps/sources-repo/wm-switcher/opt/wm-switcher/*

for bindir in $(find apps/sources-repo -type d -name bin); do chmod +x -v $bindir/* ; done

for debdir in $(find apps/sources-repo -type d -name DEBIAN); do chmod +x -v $debdir/p* ; done

ls repo/sources > repo/packages.list

for package in $(cat repo/packages.list); do dpkg-deb -b repo/sources/$package repo/packages/ ; done

cp -v repo/web-packages/* repo/packages/

cp -v /var/lib/buildkite-agent/davinci-resolve*.deb repo/packages/

cp -v repo/builds/windowck/*.deb repo/packages/

cp -v repo/builds/gif-wallpaper/*.deb repo/packages/

find repo/packages -name '*.deb' -type f | xargs dpkg-sig --sign builder

find repo/packages -name '*.deb' -type f | xargs reprepro -P --ask-passphrase -Vb website/repo includedeb core

mkdir radix-repo;cd radix-repo;mv -v ../website .;git init

git config --global user.email "rauldipeas@mail.com"

git config --global user.name "Raul Dipeas"

git remote add origin git@ssh.dev.azure.com:v3/rauldipeas/RaDiX/radix-repo

git add .;git commit -m "buildkite auto release"

git push -f -u origin master
