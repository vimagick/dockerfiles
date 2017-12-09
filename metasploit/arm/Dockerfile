#
# Dockerfile for metasploit-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

ENV MSF_VERSION 4.16.22
ENV APP_HOME /usr/src/metasploit-framework/
ENV MSF_USER msf
ENV NMAP_PRIVILEGED=""

ARG BUNDLER_ARGS="--jobs=8 --without development test coverage"
WORKDIR $APP_HOME

RUN set -xe \
    && apk update \
    && apk add libcap \
               ncurses \
               nmap \
               nmap-nselibs \
               nmap-scripts \
               postgresql-libs \
               ruby \
               ruby-bigdecimal \
               ruby-bundler \
               ruby-io-console \
               sqlite-libs \
    && apk add --virtual .ruby-builddeps \
               autoconf \
               bison \
               build-base \
               curl \
               git \
               libffi-dev \
               libpcap-dev \
               libressl-dev \
               libxml2-dev \
               libxslt-dev \
               ncurses-dev \
               postgresql-dev \
               readline-dev \
               ruby-dev \
               sqlite-dev \
               tar \
               yaml-dev \
               zlib-dev \
    && curl -sSL https://github.com/rapid7/metasploit-framework/archive/$MSF_VERSION.tar.gz | tar xz --strip 1 \
    && echo "gem: --no-ri --no-rdoc" > /etc/gemrc \
    && gem update --system \
    && gem install bundler \
    && bundle install --system $BUNDLER_ARGS \
    && apk del .ruby-builddeps \
    && rm -rf /var/cache/apk/*

RUN set -xe \
    && adduser -g msfconsole -D $MSF_USER \
    && setcap cap_net_raw,cap_net_bind_service=+eip /usr/bin/ruby \
    && setcap cap_net_raw,cap_net_bind_service=+eip /usr/bin/nmap

USER $MSF_USER

CMD ["./msfconsole", "-r", "docker/msfconsole.rc"]
