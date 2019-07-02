#!/bin/bash
wget -cO DaVinci_Resolve_16.0b4_Linux.zip https://www.dropbox.com/s/u1hsqvkd2ofyxf4/DaVinci_Resolve_16.0b4_Linux.zip?dl=1
wget -cO makeresolvedeb.tar.gz http://www.danieltufvesson.com/download/?file=makeresolvedeb/makeresolvedeb_16.0b4-1.sh.tar.gz
unzip DaVinci_Resolve*.zip;tar -vzxf makeresolvedeb*.tar.gz
sed -i 's/Icon=\/opt\/resolve\/graphics\/DV_Resolve.png/Icon=resolve/g' makeresolvedeb*.sh
sed -i 's/Architecture: amd64/Architecture: amd64\nDepends: curlew, ocl-icd-libopencl1\nSection: video/g' makeresolvedeb*.sh
sed -i 's/fakeroot dpkg-deb -b/rm -rfv DaVinci_Resolve*.run\nfakeroot dpkg-deb -b/g' makeresolvedeb*.sh
rm -rfv DaVinci_Resolve*.zip
./makeresolvedeb*.sh lite;rm -rfv *.pdf *.run makeresolvedeb*;mv *.deb repo/builds/resolve/
