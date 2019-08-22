FROM docker:latest

MAINTAINER Paul Spooren <mail@aparcar.org>

RUN apk update && \
    apk add alpine-sdk \
            bash \
            bzip2 \
            coreutils \
            curl \
            file \
            findutils \
            gawk \
            gnupg \
            grep \
            linux-headers \
            ncurses-dev \
            outils-signify \
            perl \
            python2 \
            python3 \
            rsync \
            rsync \
            unzip \
            wget \
            xz \
            zlib-dev

WORKDIR /meta
COPY docker-common.sh .
RUN /meta/docker-common.sh
COPY docker-prepare.sh .
ARG DOCKER_IMAGE=openwrt-sdk
ARG DOWNLOAD_FILE="openwrt-sdk-*x86_64.tar.xz"
RUN /meta/docker-prepare.sh
RUN mv /meta/build /openwrt
WORKDIR /openwrt
