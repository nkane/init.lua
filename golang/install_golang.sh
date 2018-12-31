# set version and distro
VERSION=1.11.4
DISTRO=linux-amd64
INSTALL_PATH=/usr/local

# example version(s)
# https://dl.google.com/go/go1.11.4.linux-amd64.tar.gz
# https://dl.google.com/go/go1.11.4.linux-armv6l.tar.gz
echo 'Downloading golang'
wget https://dl.google.com/go/go$VERSION.$DISTRO.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.$DISTRO.tar.gz
export PATH=$PATH:/usr/local/go/bin
rm go$VERSION.$DISTRO.tar.gz
