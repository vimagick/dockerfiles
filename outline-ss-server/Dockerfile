#
# Dockerfile for outline-ss-server
#

FROM alpine:3.24
LABEL maintainer="EasyPi Software Foundation"
LABEL org.opencontainers.image.source="https://github.com/vimagick/dockerfiles/tree/master/outline-ss-server"

ARG TARGETPLATFORM
ARG OUTLINE_SS_SERVER_VERSION

ARG IP_ASN_MMDB_VERSION=2026-09
ARG IP_ASN_MMDB_URL=https://download.db-ip.com/free/dbip-asn-lite-${IP_ASN_MMDB_VERSION}.mmdb.gz
ARG IP_ASN_MMDB_FILE=ip-asn.mmdb

ARG IP_COUNTRY_MMDB_VERSION=2026-09
ARG IP_COUNTRY_MMDB_URL=https://download.db-ip.com/free/dbip-country-lite-${IP_COUNTRY_MMDB_VERSION}.mmdb.gz
ARG IP_COUNTRY_MMDB_FILE=ip-country.mmdb

WORKDIR /app

RUN set -xe \
 && OUTLINE_SS_SERVER_ARCH=$(echo $TARGETPLATFORM | sed -e 's@linux/amd64@x86_64@' \
                                                        -e 's@linux/arm64@arm64@') \
 && OUTLINE_SS_SERVER_FILE=outline-ss-server_${OUTLINE_SS_SERVER_VERSION}_linux_${OUTLINE_SS_SERVER_ARCH}.tar.gz \
 && OUTLINE_SS_SERVER_URL=https://github.com/OutlineFoundation/tunnel-server/releases/download/v${OUTLINE_SS_SERVER_VERSION}/${OUTLINE_SS_SERVER_FILE} \
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
