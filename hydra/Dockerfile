#
# Dockerfile for hydra
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U bash \
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
               openssl \
               openssl-dev \
               parallel \
               pcre \
               pcre-dev \
               postgresql-dev \
    && echo 'will cite' | parallel --bibtex \
    && mkdir src \
        && cd src \
        && git clone https://github.com/vanhauser-thc/thc-hydra.git . \
        && ./configure --prefix=/usr \
        && make install \
        && cd .. \
        && rm -rf src \
    && apk del --purge build-base \
                       libidn-dev \
                       libssh-dev \
                       ncurses-dev \
                       mariadb-dev \
                       openssl-dev \
                       pcre-dev \
                       postgresql-dev \
    && rm -rf /var/cache/apk/*

VOLUME /work
WORKDIR /work
CMD ["bash"]
