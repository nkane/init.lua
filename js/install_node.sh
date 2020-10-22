# set version and distro
VERSION=v12.19.0
DISTRO=linux-x64
INSTALL_PATH=~/bin

# example urls
# https://nodejs.org/dist/v10.14.2/node-v10.14.2-linux-armv7l.tar.xz
# https://nodejs.org/dist/v10.14.2/node-v10.14.2-linux-x64.tar.xz
# https://nodejs.org/dist/v11.5.0/node-v11.5.0-linux-armv7l.tar.xz
echo 'downloading nodejs'
wget https://nodejs.org/dist/$VERSION/node-$VERSION-$DISTRO.tar.xz ~/downloads
mkdir -p $INSTALL_PATH/nodejs
tar -xJvf node-$VERSION-$DISTRO.tar.xz -C $INSTALL_PATH/nodejs
mv $INSTALL_PATH/nodejs/node-$VERSION-$DISTRO/* $INSTALL_PATH/nodejs/
rm -rf $INSTALL_PATH/nodejs/node-$VERSION-$DISTRO
rm node-$VERSION-$DISTRO.tar.xz
