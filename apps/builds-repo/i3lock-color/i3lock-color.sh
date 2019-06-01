#!/bin/bash

sudo apt-get install -y \
      autoconf \
      automake \
      checkinstall \
      libev-dev \
      libxcb-composite0 \
      libxcb-composite0-dev \
      libxcb-xinerama0 \
      libxcb-randr0 \
      libxcb-xinerama0-dev \
      libxcb-xkb-dev \
      libxcb-image0-dev \
      libxcb-util-dev \
      libxkbcommon-x11-dev \
      libjpeg-turbo8-dev \
      libpam0g-dev \
      pkg-config \
      xcb-proto \
      libxcb-xrm-dev \
      libxcb-randr0-dev \
      libxkbcommon-dev \
      libcairo2-dev \
      libxcb1-dev \
      libxcb-dpms0-dev \
      libxcb-image0-dev \
      libxcb-util0-dev \
      libev-dev \
      libxcb-xinerama0-dev \
      libxcb-xkb-dev

cd;git clone https://github.com/PandorasFox/i3lock-color

cd i3lock-color
autoreconf -fi
./configure --prefix=/usr --sysconfdir=/etc --enable-debug=no --disable-sanitizers
cd x86_64-pc-linux-gnu;make -j8;cd ..
sudo checkinstall --pkgname=i3lock-color --pkgversion=1 -y

cd;git clone https://github.com/pavanjadhaw/betterlockscreen

#sudo apt autoremove --purge -y autoconf automake autotools-dev checkinstall libcairo-script-interpreter2 libcairo2-dev libev-dev libfontconfig1-dev libfreetype6-dev libglib2.0-dev libglib2.0-dev-bin libice-dev libjpeg-turbo8-dev libpam0g-dev libpcre16-3 libpcre3-dev libpcre32-3 libpcrecpp0v5 libpixman-1-dev libpng-dev libpng-tools libpthread-stubs0-dev libsm-dev libx11-dev libxau-dev libxcb-composite0-dev libxcb-dpms0 libxcb-dpms0-dev libxcb-image0-dev libxcb-randr0-dev libxcb-render0-dev libxcb-shape0-dev libxcb-shm0-dev libxcb-util-dev libxcb-util0-dev libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb1-dev libxdmcp-dev libxext-dev libxkbcommon-dev libxkbcommon-x11-dev libxrender-dev pkg-config uuid-dev x11proto-core-dev x11proto-dev x11proto-xext-dev xcb-proto xorg-sgml-doctools xtrans-dev