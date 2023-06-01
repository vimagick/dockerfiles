#
# Dockerfile for outline-ss-server
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG OUTLINE_SS_SERVER_VERSION=1.4.0
ARG OUTLINE_SS_SERVER_FILE=outline-ss-server_${OUTLINE_SS_SERVER_VERSION}_linux_x86_64.tar.gz
ARG OUTLINE_SS_SERVER_URL=https://github.com/Jigsaw-Code/outline-ss-server/releases/download/v${OUTLINE_SS_SERVER_VERSION}/${OUTLINE_SS_SERVER_FILE}

ARG IP_COUNTRY_MMDB_VERSION=2023-06
ARG IP_COUNTRY_MMDB_URL=https://download.db-ip.com/free/dbip-country-lite-${IP_COUNTRY_MMDB_VERSION}.mmdb.gz
ARG IP_COUNTRY_MMDB_FILE=ip-country.mmdb

WORKDIR /app

RUN set -xe \
 && apk add --no-cache curl tar \
 && mkdir -p bin etc var \
 && curl -sSL ${OUTLINE_SS_SERVER_URL} | tar xz -C bin outline-ss-server \
 && curl -sSL ${IP_COUNTRY_MMDB_URL} | gunzip -c > var/${IP_COUNTRY_MMDB_FILE} \
 && /app/bin/outline-ss-server -version \
 && apk del curl tar

EXPOSE 9092

ENTRYPOINT ["/app/bin/outline-ss-server"]
CMD ["-config=etc/config.yml", "-ip_country_db=var/ip-country.mmdb", "-metrics=0.0.0.0:9092", "-replay_history=10000"]
