#!/bin/bash
killall -9 xwinwrap gifview
mkdir -p ~/.config/autostart
cp /usr/share/applications/gif-wallpaper.desktop ~/.config/autostart/
cp $1 ~/.gif-wallpaper.gif
sed -i 's/Exec=\/opt\/gif-wallpaper\/gif-wallpaper.sh %f/Exec=sh -c "sleep 5;\/opt\/gif-wallpaper\/gif-wallpaper.sh .gif-wallpaper.gif"/g' ~/.config/autostart/gif-wallpaper.desktop
xwinwrap -g `xdpyinfo | awk '/dimensions/{print $2}'` -ni -s -nf -b -un -argb -st -ov -- gifview -a -w WID $1
