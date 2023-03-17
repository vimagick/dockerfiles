#
# Dockerfile for rinetd
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG RINETD_VERSION=0.73
ARG RINETD_URL=https://github.com/samhocevar/rinetd/releases/download/v${RINETD_VERSION}/rinetd-${RINETD_VERSION}.tar.gz

RUN set -xe \
    && apk add --no-cache build-base curl tar \
    && mkdir rinetd \
    && cd rinetd \
    && curl -sSL $RINETD_URL | tar xz --strip 1 \
    && ./configure --prefix=/usr --sysconfdir=/etc/rinetd \
    && make install \
    && cd .. \
    && rm -r rinetd \
    && apk del build-base curl tar

VOLUME /etc/rinetd

CMD ["rinetd", "-f", "-c", "/etc/rinetd/rinetd.conf"]
