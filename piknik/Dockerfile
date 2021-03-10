#
# Dockerfile for piknik
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ENV PIKNIK_VERSION=0.10.1
ENV PIKNIK_FILE=piknik-linux_x86_64-${PIKNIK_VERSION}.tar.gz
ENV PIKNIK_URL=https://github.com/jedisct1/piknik/releases/download/${PIKNIK_VERSION}/${PIKNIK_FILE}

RUN set -xe \
    && apk add --no-cache curl libc6-compat tar \
    && curl -sSL ${PIKNIK_URL} | tar xz -C /usr/local/bin --strip 1 linux-x86_64/piknik \
    && mkdir -p /etc/piknik \
    && ln -s /lib /lib64 \
    && apk del curl tar

EXPOSE 8075

ENTRYPOINT ["piknik"]
CMD ["-config", "/etc/piknik/piknik.toml", "-server"]
