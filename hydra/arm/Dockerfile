#
# Dockerfile for hydra-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

ENV HYDRA_VERSION=8.6
ENV HYDRA_URL=https://github.com/vanhauser-thc/thc-hydra/archive/$HYDRA_VERSION.tar.gz

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
                          mariadb-libs \
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

VOLUME /hydra
WORKDIR /hydra

CMD ["bash"]
