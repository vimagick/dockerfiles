#
# Dockerfile for shairplay-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache alsa-utils \
                          autoconf \
                          automake \
                          avahi-dev \
                          build-base \
                          curl \
                          dbus \
                          libao \
                          libao-dev \
                          libltdl \
                          libtool \
    && curl -sSL https://github.com/juhovh/shairplay/archive/master.tar.gz | tar xz \
    && cd shairplay-master \
    && ./autogen.sh \
    && ./configure \
    && make install \
    && cp airport.key /airport.key \
    && cd .. \
    && rm -rf shairplay-master \
    && apk del autoconf \
               automake \
               build-base \
               curl \
               libao-dev

ENV APNAME EasyPi

CMD set -xe \
    && rm -f /var/run/dbus.pid \
    && dbus-daemon --system \
    && sleep 1 \
    && avahi-daemon -D \
    && sleep 1 \
    && shairplay --apname="$APNAME"
