#
# Dockerfile for pure-ftpd
#

FROM alpine:3.24 AS build

ARG PURE_FTPD_VERSION
ARG PURE_FTPD_FILE=pure-ftpd-${PURE_FTPD_VERSION}.tar.gz
ARG PURE_FTPD_URL=https://download.pureftpd.org/pub/pure-ftpd/releases/${PURE_FTPD_FILE}

WORKDIR /src

RUN set -xe \
 && apk add --no-cache build-base    \
                       curl          \
                       libsodium-dev \
                       openssl-dev   \
 && curl -sSfL ${PURE_FTPD_URL} | tar xz --strip 1 \
 && ./configure --prefix=/usr               \
                --sysconfdir=/etc/pure-ftpd \
                --with-minimal              \
                --with-throttling           \
                --with-puredb               \
                --with-tls                  \
                --with-altlog               \
                --with-ftpwho               \
                --with-uploadscript         \
 && make install \
 && pure-ftpd -h

FROM alpine:3.24
LABEL maintainer="EasyPi Software Foundation"

COPY --from=build /usr/sbin/pure-* /usr/sbin/
COPY --from=build /usr/bin/pure-* /usr/bin/

ENV PURE_PASSWDFILE=/etc/pure-ftpd/pureftpd.passwd
ENV PURE_DBFILE=/etc/pure-ftpd/pureftpd.pdb

RUN set -xe \
 && adduser -D -u 1000 -h /home/ftpuser -s /sbin/nologin ftpuser \
 && apk add --no-cache libsodium libssl3 \
 && mkdir -p /etc/pure-ftpd /var/log/pure-ftpd

VOLUME /home/ftpuser /etc/pure-ftpd

EXPOSE 21

ENTRYPOINT ["pure-ftpd", "-l", "puredb:/etc/pure-ftpd/pureftpd.pdb", "-O", "clf:/var/log/pure-ftpd/pureftpd.log", "-f", "none"]
CMD ["-A", "-E", "-j"]