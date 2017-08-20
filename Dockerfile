FROM arm32v7/debian:stretch-slim

ARG BUILD_DEPS="git ca-certificates \
                build-essential autoconf automake libtool pkg-config \
                libcurl4-gnutls-dev libjansson-dev uthash-dev libncursesw5-dev libudev-dev libusb-1.0-0-dev libevent-dev libmicrohttpd-dev"
ARG RUNTIME_DEPS="ca-certificates"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update; \
    apt-get install -y --no-install-recommends ${BUILD_DEPS} ${RUNTIME_DEPS}

RUN git clone --depth=1 https://github.com/luke-jr/bfgminer.git; \
    cd bfgminer; \
    ./autogen.sh; \
    ./configure --disable-other-drivers --enable-gridseed --enable-scrypt; \
    make -j 2; \
    make install; \
    cd ../; \
    rm -rf bfgminer; \
    echo '/usr/local/lib' > /etc/ld.so.conf.d/usrlocal.conf; \
    ldconfig

RUN apt-get purge -y ${BUILD_DEPS}; \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["bfgminer"]
