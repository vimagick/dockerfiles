#
# Dockerfile for tor
#

FROM alpine:edge
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache build-base \
                          curl \
                          git \
                          gmp-dev \
                          go \
                          libgmpxx \
                          python \
                          python-dev \
                          tor \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install --no-cache-dir fteproxy \
                   obfsproxy \
    && GOPATH=/tmp/obfs4 go get git.torproject.org/pluggable-transports/obfs4.git/obfs4proxy \
        && mv /tmp/obfs4/bin/obfs4proxy /usr/bin \
        && rm -rf /tmp/obfs4 \
    && GOPATH=/tmp/meek go get git.torproject.org/pluggable-transports/meek.git/meek-server \
        && mv /tmp/meek/bin/meek-server /usr/bin \
        && rm -rf /tmp/meek \
    && apk del build-base \
               curl \
               git \
               gmp-dev \
               go \
               python-dev

COPY ./torrc /etc/tor/torrc

USER tor
WORKDIR /var/lib/tor
VOLUME /etc/tor /var/lib/tor
EXPOSE 7002 9001 9030 9050 9051

CMD ["/usr/bin/tor", "-f", "/etc/tor/torrc"]
