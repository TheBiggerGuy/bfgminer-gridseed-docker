FROM multiarch/alpine:amd64-v3.6
MAINTAINER Guy Taylor <thebigguy.co.uk@gmail.com>

COPY build.sh /build/build.sh
WORKDIR /build
RUN /build/build.sh && \
    rm -rf /build

ENTRYPOINT ["bfgminer"]
CMD ["--text-only"]
