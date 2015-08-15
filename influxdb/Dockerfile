#
# Dockerfile for influxdb
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y wget \
    && wget https://s3.amazonaws.com/influxdb/influxdb_0.9.2_amd64.deb \
    && dpkg -i influxdb_0.9.2_amd64.deb \
    && sed -i '/^reporting-disabled/s/false/true/' /etc/opt/influxdb/influxdb.conf \
    && rm influxdb_0.9.2_amd64.deb \
    && apt-get purge --auto-remove -y wget \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8083 8086 8088

CMD ["/opt/influxdb/influxd", "-config", "/etc/opt/influxdb/influxdb.conf"]
