#!/bin/bash
wget https://bitbucket.org/rauldipeas/davinci-resolve/raw/59e8f38ff4d887b03929c0f940d73c57d7a13b4c/DaVinci_Resolve_16.0b4_Linux.zip
wget -O makeresolvedeb.tar.gz http://www.danieltufvesson.com/download/?file=makeresolvedeb/makeresolvedeb_16.0b4-1.sh.tar.gz
unzip DaVinci_Resolve*.zip;tar -vzxf makeresolvedeb*.tar.gz
sed -i 's/Icon=\/opt\/resolve\/graphics\/DV_Resolve.png/Icon=resolve/g' makeresolvedeb*.sh
sed -i 's/Architecture: amd64/Architecture: amd64\nDepends: curlew, ocl-icd-libopencl1\nSection: video/g' makeresolvedeb*.sh
./makeresolvedeb*.sh lite;rm -rfv *.pdf *.run makeresolvedeb*;mv *.deb ../
