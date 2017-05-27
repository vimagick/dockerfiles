#
# Dockerfile for drone-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache ca-certificates

ADD drone /drone

ENV DATABASE_DRIVER=sqlite3 \
    DATABASE_CONFIG=/var/lib/drone/drone.sqlite \
    GODEBUG=netdns=go \
    XDG_CACHE_HOME=/var/lib/drone

VOLUME $XDG_CACHE_HOME
WORKDIR $XDG_CACHE_HOME

EXPOSE 8000

ENTRYPOINT ["/drone"]
CMD ["server"]
