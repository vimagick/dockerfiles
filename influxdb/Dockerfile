#
# Dockerfile for influxdb
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

ENV INFLUXDB_VERSION=1.0.0
ENV INFLUXDB_FILE=influxdb_${INFLUXDB_VERSION}_amd64.deb
ENV INFLUXDB_MD5=a25daf049d2482166b248fe2d0be4b69
ENV INFLUXDB_URL=https://dl.influxdata.com/influxdb/releases/${INFLUXDB_FILE}
ENV COLLECTD_URL=https://github.com/collectd/collectd/raw/master/src/types.db

RUN set -xe \
    && apt-get update \
    && apt-get install -y ca-certificates wget \
    && wget ${INFLUXDB_URL} -O ${INFLUXDB_FILE} \
    && echo "${INFLUXDB_MD5}  ${INFLUXDB_FILE}" | md5sum -c \
    && dpkg -i ${INFLUXDB_FILE} \
    && sed -i '/^reporting-disabled/s/false/true/' /etc/influxdb/influxdb.conf \
    && wget ${COLLECTD_URL} -O /usr/lib/influxdb/types.db \
    && apt-get purge --auto-remove -y wget \
    && rm -rf ${INFLUXDB_FILE} \
              /var/lib/apt/lists/*

VOLUME /etc/influxdb /var/lib/influxdb
EXPOSE 8083 8086 8088

CMD ["influxd", "-config", "/etc/influxdb/influxdb.conf"]
