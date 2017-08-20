#!/usr/bin/env bash

BUILD_DEPS="git ca-certificates \
            build-essential autoconf automake libtool pkg-config \
            libcurl4-gnutls-dev libjansson-dev uthash-dev libncursesw5-dev libudev-dev libusb-1.0-0-dev libevent-dev"
RUNTIME_DEPS="ca-certificates"

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends ${RUNTIME_DEPS}
apt-get install -y --no-install-recommends ${BUILD_DEPS}

git clone --depth=1 https://github.com/luke-jr/bfgminer.git
cd bfgminer
./autogen.sh
./configure --disable-other-drivers --enable-gridseed --enable-scrypt --without-libmicrohttpd
make -j 2
make install
cd ../
rm -rf bfgminer
echo '/usr/local/lib' > /etc/ld.so.conf.d/usrlocal.conf
ldconfig

apt-get purge -y ${BUILD_DEPS}
rm -rf /var/lib/apt/lists/*

