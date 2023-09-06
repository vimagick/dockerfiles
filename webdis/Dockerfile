#
# Dockerfile for webdis
#

FROM alpine:3.18 AS stage
ENV WEBDIS_VERSION=0.1.22
RUN apk add --no-cache wget make gcc libevent-dev msgpack-c-dev musl-dev openssl-dev bsd-compat-headers jq
RUN wget https://github.com/nicolasff/webdis/archive/$WEBDIS_VERSION.tar.gz -O webdis.tar.gz
RUN tar -xvzf webdis.tar.gz && cd webdis-$WEBDIS_VERSION && make && make install
RUN which webdis

FROM alpine:3.18
MAINTAINER EasyPi Software Foundation
RUN apk add --no-cache libcrypto1.1 libevent msgpack-c
COPY --from=stage /usr/local/bin/webdis /usr/local/bin/
EXPOSE 7379
CMD ["webdis", "/etc/webdis/webdis.json"]
