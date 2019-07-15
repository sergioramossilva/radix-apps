#!/bin/bash
cp -rv ~/Downloads/DaVinci_Resolve_16.0b6_Linux.zip .
#wget -cO DaVinci_Resolve_16.0b5_Linux.zip https://SOMEWHEREdotCOM/DaVinci_Resolve_16.0b6_Linux.zip?dl=1
wget -cO makeresolvedeb.tar.gz http://www.danieltufvesson.com/download/?file=makeresolvedeb/makeresolvedeb_16.0b6-1.sh.tar.gz
unzip DaVinci_Resolve*.zip;tar -vzxf makeresolvedeb*.tar.gz
sed -i 's/Icon=\/opt\/resolve\/graphics\/DV_Resolve.png/Icon=resolve/g' makeresolvedeb*.sh
sed -i 's/Architecture: amd64/Architecture: amd64\nDepends: ffmulticonverter, ocl-icd-libopencl1\nSection: video/g' makeresolvedeb*.sh
sed -i 's/fakeroot dpkg-deb -b/rm -rfv DaVinci_Resolve*.run\nfakeroot dpkg-deb -b/g' makeresolvedeb*.sh
rm -rfv DaVinci_Resolve*.zip
./makeresolvedeb*.sh lite;rm -rfv *.pdf makeresolvedeb*
mkdir -p davinci-resolve;mv davinci-resolve*.deb davinci-resolve/
netlify deploy --site=20678084-dbb0-4bed-b52d-e9af63ffe6de --dir=davinci-resolve --prod;rm -rfv davinci-resolve
