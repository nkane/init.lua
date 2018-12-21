# set version and distro
VERSION=
DISTRO=
INSTALL_PATH=~/bin

if [! -d ~/downloads ]; then 
    # example urls
    # https://nodejs.org/dist/v10.14.2/node-v10.14.2-linux-armv7l.tar.xz
    # https://nodejs.org/dist/v10.14.2/node-v10.14.2-linux-x64.tar.xz
    echo 'downloading nodejs'
    wget https://nodejs.org/dist/$VERSION/node-$VERSION-$DISTRO.tar.xz
    mkdir -p $INSTALL_PATH/nodejs
    tar -xJvf node-$VERSION-$DISTRO.tar.xz -C $INSTALL_PATH/nodejs
    sudo mv /usr/local/lib/nodejs/node-$VERSION-$DISTRO $INSTALL_PATH/nodejs/node-$VERSION
fi
