#
# Dockerfile for ot-frontend-arm
#

FROM arm32v7/alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache gettext \
    && mv /usr/bin/envsubst /tmp/ \
    && runDeps="$( \
        scanelf --needed --nobanner /tmp/envsubst \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | sort -u \
            | xargs -r apk info --installed \
            | sort -u \
    )" \
    && apk add --no-cache $runDeps \
    && apk del gettext

RUN set -xe \
    && apk add --no-cache curl nginx \
    && mv /tmp/envsubst /usr/local/bin/ \
    && curl -sSLO https://github.com/owntracks/frontend/archive/master.tar.gz \
    && mkdir -p /usr/share/nginx/html/ \
    && tar xzf master.tar.gz --strip-components=1 -C /usr/share/nginx/html/ frontend-master/index.html frontend-master/static \
    && tar xzf master.tar.gz --strip-components=1 -C /etc/nginx/ frontend-master/nginx.tmpl \
    && rm master.tar.gz

ENV LISTEN_PORT=80
ENV SERVER_HOST=otrecorder
ENV SERVER_PORT=8083

EXPOSE 80

CMD set -xe \
    && envsubst '${SERVER_HOST}:${SERVER_PORT}' < /etc/nginx/nginx.tmpl > /etc/nginx/nginx.conf \
    && nginx -g 'daemon off;'
