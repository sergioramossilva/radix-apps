#!/bin/bash
sudo apt install -y libdbus-1-dev libsystemd-dev meson ninja-build pkg-config
git clone https://github.com/FeralInteractive/gamemode.git
cd gamemode
git checkout 1.3.1
sed -i '33d;34d;35d;36d;37d;38d;39d;40d' bootstrap.sh
./bootstrap.sh
mkdir -p -v ../../package/usr/lib/x86_64-linux-gnu ../../package/usr/bin ../../package/usr/libexec ../../package/usr/include ../../package/usr/share/man/man8 ../../package/usr/lib/x86_64-linux-gnu/pkgconfig ../../package/etc/systemd/user ../../package/usr/share/dbus-1/services ../../package/usr/share/polkit-1/actions
cp -rv /usr/lib/x86_64-linux-gnu/libgamemode.so.0.0.0 ../../package/usr/lib/x86_64-linux-gnu/
cp -rv /usr/lib/x86_64-linux-gnu/libgamemode.so.0 ../../package/usr/lib/x86_64-linux-gnu/
cp -rv /usr/lib/x86_64-linux-gnu/libgamemode.so ../../package/usr/lib/x86_64-linux-gnu/
cp -rv /usr/lib/x86_64-linux-gnu/libgamemodeauto.so.0.0.0 ../../package/usr/lib/x86_64-linux-gnu/
cp -rv /usr/lib/x86_64-linux-gnu/libgamemodeauto.so.0 ../../package/usr/lib/x86_64-linux-gnu/
cp -rv /usr/lib/x86_64-linux-gnu/libgamemodeauto.so ../../package/usr/lib/x86_64-linux-gnu/
cp -rv /usr/bin/gamemoded ../../package/usr/bin/
cp -rv /usr/libexec/cpugovctl ../../package/usr/libexec/
cp -rv /usr/libexec/gpuclockctl ../../package/usr/libexec/
cp -rv /usr/include/gamemode_client.h ../../package/usr/include/
cp -rv /usr/share/man/man8/gamemoded.8 ../../package/usr/share/man/man8/
cp -rv /usr/lib/x86_64-linux-gnu/pkgconfig/gamemode.pc ../../package/usr/lib/x86_64-linux-gnu/pkgconfig/
cp -rv /usr/lib/x86_64-linux-gnu/pkgconfig/gamemode-auto.pc ../../package/usr/lib/x86_64-linux-gnu/pkgconfig/
cp -rv /etc/systemd/user/gamemoded.service ../../package/etc/systemd/user/
cp -rv /usr/share/dbus-1/services/com.feralinteractive.GameMode.service ../../package/usr/share/dbus-1/services/
cp -rv /usr/share/polkit-1/actions/com.feralinteractive.GameMode.policy ../../package/usr/share/polkit-1/actions/
cp -rv /usr/bin/gamemoderun ../../package/usr/bin/
systemctl --user stop gamemoded.service
cd build/
sudo ninja uninstall
cd ../../
sudo rm -rfv gamemode
sudo apt autoremove --purge -y libdbus-1-dev libsystemd-dev meson ninja-build pkg-config
sudo rm -rfv /usr/lib/python3/dist-packages/mesonbuild/
cd ..
dpkg-deb -b package .
