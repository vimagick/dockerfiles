#
# Dockerfile for hydra
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG HYDRA_VERSION=9.5
ARG HYDRA_URL=https://github.com/vanhauser-thc/thc-hydra/archive/v${HYDRA_VERSION}.tar.gz

RUN set -xe \
    && apk add --no-cache apr-dev \
                          apr-util-dev \
                          bash \
                          build-base \
                          coreutils \
                          curl \
                          jq \
                          libidn \
                          libidn-dev \
                          libpq \
                          libssh \
                          libssh-dev \
                          mariadb-connector-c \
                          mariadb-connector-c-dev \
                          mariadb-dev \
                          ncurses \
                          ncurses-dev \
                          parallel \
                          pcre \
                          pcre-dev \
                          postgresql-dev \
                          subversion-dev \
                          subversion-libs \
                          tar \
                          tmux \
    && parallel --will-cite \
    && mkdir src \
        && cd src \
        && curl -sSL $HYDRA_URL | tar xz --strip 1 \
        && ./configure --prefix=/usr \
        && make install \
        && cd .. \
        && rm -rf src \
    && apk del --purge apr-dev \
                       apr-util-dev \
                       build-base \
                       libidn-dev \
                       libssh-dev \
                       ncurses-dev \
                       mariadb-connector-c-dev \
                       mariadb-dev \
                       pcre-dev \
                       postgresql-dev \
                       subversion-dev

ENTRYPOINT ["bash"]
