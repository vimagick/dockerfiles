#
# Dockerfile for ggr
#

FROM golang:alpine
RUN apk add --no-cache git
RUN go get -v github.com/kelseyhightower/confd

FROM aerokube/ggr
RUN apk add --no-cache curl libxml2-utils supervisor
COPY --from=0 /go/bin/confd /usr/bin/
COPY data/confd /etc/confd
COPY data/supervisor.d /etc/supervisor.d
COPY data/grid-router /etc/grid-router
EXPOSE 4444
ENTRYPOINT ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
HEALTHCHECK CMD ["curl", "-f", "http://127.0.0.1:4444/ping"]
