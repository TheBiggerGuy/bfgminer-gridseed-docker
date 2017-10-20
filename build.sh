#!/usr/bin/env sh

set -e
set -x

BUILD_DEPS="git ca-certificates \
            gcc g++ autoconf automake make libtool pkgconf \
            curl-dev jansson-dev uthash-dev ncurses-dev libusb-dev libevent-dev libgcrypt-dev linux-headers"
RUNTIME_DEPS="ca-certificates libcurl jansson uthash ncurses libusb libevent"

apk add --no-cache ${RUNTIME_DEPS}
apk add --no-cache ${BUILD_DEPS}

# fix for ccan
mkdir -p /usr/include/sys
echo '#include <unistd.h>' > /usr/include/sys/unistd.h

git clone --depth=1 https://github.com/luke-jr/bfgminer.git
cd bfgminer
./autogen.sh
./configure --disable-other-drivers --enable-gridseed --enable-scrypt --without-libmicrohttpd
make -j 2
make install
cd ../
rm -rf bfgminer

# clean up build system
apk del ${BUILD_DEPS}
# ensure you have the runtime dep and they where not removed with the dev deps
apk add --no-cache ${RUNTIME_DEPS}