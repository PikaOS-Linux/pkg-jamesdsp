#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone --recursive https://github.com/Audio4Linux/JDSP4Linux
cd JDSP4Linux
cp -rvf ../debian ./

# Get build deps
apt-get build-dep ./ -y

qmake ../JDSP4Linux.pro
# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
