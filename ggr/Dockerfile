#
# Dockerfile for ggr
#

FROM golang:alpine
RUN apk add --no-cache git
RUN go get -v github.com/kelseyhightower/confd

FROM aerokube/ggr
RUN apk add --no-cache libxml2-utils supervisor
COPY --from=0 /go/bin/confd /usr/bin/
COPY data/confd /etc/confd
COPY data/supervisor.d /etc/supervisor.d
COPY data/grid-router /etc/grid-router
ENTRYPOINT ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
