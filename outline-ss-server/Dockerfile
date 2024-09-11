#
# Dockerfile for outline-ss-server
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG OUTLINE_SS_SERVER_VERSION=1.5.0
ARG OUTLINE_SS_SERVER_OS=linux
ARG OUTLINE_SS_SERVER_ARCH=x86_64
ARG OUTLINE_SS_SERVER_FILE=outline-ss-server_${OUTLINE_SS_SERVER_VERSION}_${OUTLINE_SS_SERVER_OS}_${OUTLINE_SS_SERVER_ARCH}.tar.gz
ARG OUTLINE_SS_SERVER_URL=https://github.com/Jigsaw-Code/outline-ss-server/releases/download/v${OUTLINE_SS_SERVER_VERSION}/${OUTLINE_SS_SERVER_FILE}

ARG IP_ASN_MMDB_VERSION=2024-09
ARG IP_ASN_MMDB_URL=https://download.db-ip.com/free/dbip-asn-lite-${IP_ASN_MMDB_VERSION}.mmdb.gz
ARG IP_ASN_MMDB_FILE=ip-asn.mmdb

ARG IP_COUNTRY_MMDB_VERSION=2024-09
ARG IP_COUNTRY_MMDB_URL=https://download.db-ip.com/free/dbip-country-lite-${IP_COUNTRY_MMDB_VERSION}.mmdb.gz
ARG IP_COUNTRY_MMDB_FILE=ip-country.mmdb

WORKDIR /app

RUN set -xe \
 && apk add --no-cache curl tar \
 && mkdir -p bin etc var \
 && curl -sSL ${OUTLINE_SS_SERVER_URL} | tar xz -C bin outline-ss-server \
 && curl -sSL ${IP_ASN_MMDB_URL} | gunzip -c > var/${IP_ASN_MMDB_FILE} \
 && curl -sSL ${IP_COUNTRY_MMDB_URL} | gunzip -c > var/${IP_COUNTRY_MMDB_FILE} \
 && /app/bin/outline-ss-server -version \
 && apk del curl tar

EXPOSE 9092

ENTRYPOINT ["/app/bin/outline-ss-server"]
CMD ["-config=etc/config.yml", "-ip_asn_db=var/ip-asn.mmdb", "-ip_country_db=var/ip-country.mmdb", "-metrics=0.0.0.0:9092", "-replay_history=10000"]
