#
# Dockerfile for tor
#

FROM alpine:edge
MAINTAINER kev <noreply@datageek.info>

RUN echo 'http://dl-4.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add -U build-base \
                  gmp-dev \
                  libgmpxx \
                  py-pip \
                  python \
                  python-dev \
                  tor \
    && pip install fteproxy \
                   obfsproxy \
    && apk del build-base \
               gmp-dev \
               python-dev \
    && rm -rf /var/cache/apk/*

COPY ./torrc /etc/tor/torrc

USER tor
WORKDIR /home/tor

VOLUME /etc/tor /home/tor/.tor
EXPOSE 9001 9030 9050 9051

CMD ["/usr/bin/tor", "-f", "/etc/tor/torrc"]
