#
# Dockerfile for ggr
#

FROM aerokube/ggr:1.7.0
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache curl libxml2-utils supervisor \
    && curl -sSL -o /usr/bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 \
    && chmod +x /usr/bin/confd

COPY data/confd /etc/confd
COPY data/supervisor.d /etc/supervisor.d
COPY data/grid-router /etc/grid-router

EXPOSE 4444

ENTRYPOINT ["supervisord", "-n", "-c", "/etc/supervisord.conf"]

HEALTHCHECK CMD ["curl", "-f", "http://127.0.0.1:4444/ping"]
