#
# Dockerfile for grafana
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y libfontconfig wget \
    && wget https://grafanarel.s3.amazonaws.com/builds/grafana_2.1.1_amd64.deb \
    && dpkg -i grafana_2.1.1_amd64.deb \
    && apt-get purge --auto-remove -y wget \
    && rm -rf grafana_2.1.1_amd64.deb \
              /var/lib/apt/lists/*

ENV GRAFANA_HOME=/usr/share/grafana
ENV CONF_FILE=/etc/grafana/grafana.ini
ENV DATA_DIR=/var/lib/grafana
ENV LOG_DIR=/var/log/grafana

WORKDIR $GRAFANA_HOME

VOLUME $DATA_DIR $LOG_DIR
EXPOSE 3000

CMD grafana-server --config=$CONF_FILE cfg:default.paths.data=$DATA_DIR cfg:default.paths.logs=$LOG_DIR
