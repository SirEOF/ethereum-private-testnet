FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz /tmp

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    apt-get update -y && apt-get --no-install-recommends install wget curl software-properties-common -y && \
    wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | apt-key add - && \
    add-apt-repository "deb http://llvm.org/apt/xenial/ llvm-toolchain-xenial-4.0 main" && \
    add-apt-repository -y ppa:ethereum/ethereum && add-apt-repository -y ppa:ethereum/ethereum-dev && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends ethereum && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 11001 11002

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
