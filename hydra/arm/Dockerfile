#
# Dockerfile for hydra-arm
#

FROM arm32v7/alpine
MAINTAINER EasyPi Software Foundation

ENV HYDRA_VERSION=9.0
ENV HYDRA_URL=https://github.com/vanhauser-thc/thc-hydra/archive/v$HYDRA_VERSION.tar.gz

RUN set -xe \
    && apk add --no-cache apr-dev \
                          apr-util-dev \
                          bash \
                          build-base \
                          curl \
                          jq \
                          libidn \
                          libidn-dev \
                          libpq \
                          libssh \
                          libssh-dev \
                          mariadb-dev \
                          mariadb-client-libs \
                          ncurses \
                          ncurses-dev \
                          parallel \
                          pcre \
                          pcre-dev \
                          postgresql-dev \
                          subversion-dev \
                          subversion-libs \
                          tar \
    && echo 'will cite' | parallel --bibtex \
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
                       mariadb-dev \
                       pcre-dev \
                       postgresql-dev \
                       subversion-dev

ENTRYPOINT ["bash"]
