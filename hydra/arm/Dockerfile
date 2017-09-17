#
# Dockerfile for hydra-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache apr-dev \
                          apr-util-dev \
                          bash \
                          build-base \
                          curl \
                          git \
                          jq \
                          libidn \
                          libidn-dev \
                          libpq \
                          libssh \
                          libssh-dev \
                          mariadb-dev \
                          mariadb-libs \
                          ncurses \
                          ncurses-dev \
                          parallel \
                          pcre \
                          pcre-dev \
                          postgresql-dev \
                          subversion-dev \
                          subversion-libs \
    && echo 'will cite' | parallel --bibtex \
    && mkdir src \
        && cd src \
        && git clone --depth 1 https://github.com/vanhauser-thc/thc-hydra.git . \
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

VOLUME /hydra
WORKDIR /hydra

CMD ["bash"]
