#!/bin/bash

sudo apt update;sudo apt install -y reprepro dpkg-sig

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

git remote add origin git@ssh.dev.azure.com:v3/rauldipeas/radix-website/radix-repo

git add .;git commit -m "buildkite auto release"

git push -f -u origin master
