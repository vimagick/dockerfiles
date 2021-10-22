FROM alpine:3 AS builder

ENV DSVPN_VERSION=0.1.4
ENV DSVPN_URL=https://github.com/jedisct1/dsvpn/archive/${DSVPN_VERSION}.tar.gz

RUN set -xe \
    && apk add --no-cache build-base curl linux-headers \
    && curl -sSL ${DSVPN_URL} | tar xz \
    && cd dsvpn-${DSVPN_VERSION} \
    && make PREFIX=/usr install

#
# Dockerfile for dsvpn
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache iproute2
COPY --from=builder /usr/sbin/dsvpn /usr/sbin/

WORKDIR /etc/dsvpn

EXPOSE 443

ENTRYPOINT ["dsvpn"]
CMD ["server", "vpn.key", "auto", "443"]
