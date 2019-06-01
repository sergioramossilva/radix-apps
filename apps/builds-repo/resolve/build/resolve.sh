#!/bin/bash
# Baixar manualmente o DaVinci Resolve
# wget -c https://sw.blackmagicdesign.com/DaVinciResolve/v16.0b1-1/DaVinci_Resolve_16.0b1-1_Linux.zip
wget -cO makeresolvedeb.tar.gz http://www.danieltufvesson.com/download/?file=makeresolvedeb/makeresolvedeb_16.0b1-1.sh.tar.gz
unzip DaVinci_Resolve*.zip;tar -vzxf makeresolvedeb*.tar.gz
sed -i 's/Icon=\/opt\/resolve\/graphics\/DV_Resolve.png/Icon=resolve/g' makeresolvedeb*.sh
sed -i 's/Architecture: amd64/Architecture: amd64\nDepends: curlew, ocl-icd-libopencl1\nSection: video/g' makeresolvedeb*.sh
./makeresolvedeb*.sh lite;rm -rfv *.pdf *.run makeresolvedeb*
