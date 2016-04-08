#
# Dockerfile for influxdb
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

ENV INFLUXDB_VERSION=0.12.0
ENV INFLUXDB_FILE=influxdb_${INFLUXDB_VERSION}-1_amd64.deb
ENV INFLUXDB_MD5=f3aab090f6674d1dc6dc620a0499d36a
ENV INFLUXDB_URL=https://s3.amazonaws.com/influxdb/${INFLUXDB_FILE}
ENV COLLECTD_URL=https://github.com/collectd/collectd/raw/master/src/types.db

RUN set -xe \
    && apt-get update \
    && apt-get install -y wget \
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
