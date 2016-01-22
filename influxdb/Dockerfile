#
# Dockerfile for influxdb
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

ENV INFLUXDB_VER 0.9.6.1
ENV INFLUXDB_FILE influxdb_${INFLUXDB_VER}_amd64.deb
ENV INFLUXDB_URL https://s3.amazonaws.com/influxdb/${INFLUXDB_FILE}

RUN apt-get update \
    && apt-get install -y wget \
    && wget ${INFLUXDB_URL} \
    && dpkg -i ${INFLUXDB_FILE} \
    && sed -i '/^reporting-disabled/s/false/true/' /etc/influxdb/influxdb.conf \
    && apt-get purge --auto-remove -y wget \
    && rm -rf ${INFLUXDB_FILE} \
              /var/lib/apt/lists/*

VOLUME /var/lib/influxdb/
EXPOSE 8083 8086 8088

CMD ["influxd", "-config", "/etc/influxdb/influxdb.conf"]
