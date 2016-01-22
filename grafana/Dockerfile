#
# Dockerfile for grafana
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

ENV GRAFANA_VER 2.6.0
ENV GRAFANA_FILE grafana_${GRAFANA_VER}_amd64.deb
ENV GRAFANA_URL https://grafanarel.s3.amazonaws.com/builds/${GRAFANA_FILE}

RUN apt-get update \
    && apt-get install -y libfontconfig wget \
    && wget ${GRAFANA_URL} \
    && dpkg -i ${GRAFANA_FILE} \
    && apt-get purge --auto-remove -y wget \
    && rm -rf ${GRAFANA_FILE} \
              /var/lib/apt/lists/*

ENV GRAFANA_HOME=/usr/share/grafana
ENV CONF_FILE=/etc/grafana/grafana.ini
ENV DATA_DIR=/var/lib/grafana
ENV LOG_DIR=/var/log/grafana

WORKDIR $GRAFANA_HOME

VOLUME $DATA_DIR $LOG_DIR
EXPOSE 3000

CMD grafana-server --config=$CONF_FILE cfg:default.paths.data=$DATA_DIR cfg:default.paths.logs=$LOG_DIR
