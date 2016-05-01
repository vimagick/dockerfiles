#
# Dockerfile for tor
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && echo 'http://dl-4.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories \
    && echo 'http://dl-4.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add -U build-base \
                  git \
                  gmp-dev \
                  go \
                  libgmpxx \
                  py-pip \
                  python \
                  python-dev \
                  tor \
    && pip install fteproxy \
                   obfsproxy \
    && GOPATH=/tmp/obfs4 go get git.torproject.org/pluggable-transports/obfs4.git/obfs4proxy \
        && mv /tmp/obfs4/bin/obfs4proxy /usr/bin \
        && rm -rf /tmp/obfs4 \
    && GOPATH=/tmp/meek go get git.torproject.org/pluggable-transports/meek.git/meek-server \
        && mv /tmp/meek/bin/meek-server /usr/bin \
        && rm -rf /tmp/meek \
    && apk del build-base \
               git \
               gmp-dev \
               go \
               python-dev \
    && rm -rf /var/cache/apk/*

COPY ./torrc /etc/tor/torrc

USER tor
WORKDIR /var/lib/tor
VOLUME /etc/tor /var/lib/tor
EXPOSE 7002 9001 9030 9050 9051

CMD ["/usr/bin/tor", "-f", "/etc/tor/torrc"]
