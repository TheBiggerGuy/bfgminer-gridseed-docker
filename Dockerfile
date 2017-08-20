FROM arm32v7/debian:stretch-slim
MAINTAINER Guy Taylor <thebigguy.co.uk@gmail.com>

COPY build.sh /
RUN /build.sh; rm /build.sh

ENTRYPOINT ["bfgminer"]
CMD ["--text-only"]
