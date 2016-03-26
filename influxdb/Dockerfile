#
# Dockerfile for influxdb
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

ENV INFLUXDB_VERSION=0.11.0
ENV INFLUXDB_FILE=influxdb_${INFLUXDB_VERSION}-1_amd64.deb
ENV INFLUXDB_MD5=917148cda9d88aad384475c236aaf81e
ENV INFLUXDB_URL=https://s3.amazonaws.com/influxdb/${INFLUXDB_FILE}

RUN set -xe \
    && apt-get update \
    && apt-get install -y wget \
    && wget ${INFLUXDB_URL} -O ${INFLUXDB_FILE} \
    && echo "${INFLUXDB_MD5}  ${INFLUXDB_FILE}" | md5sum -c \
    && dpkg -i ${INFLUXDB_FILE} \
    && sed -i '/^reporting-disabled/s/false/true/' /etc/influxdb/influxdb.conf \
    && apt-get purge --auto-remove -y wget \
    && rm -rf ${INFLUXDB_FILE} \
              /var/lib/apt/lists/*

VOLUME /var/lib/influxdb/
EXPOSE 8083 8086 8088

CMD ["influxd", "-config", "/etc/influxdb/influxdb.conf"]
