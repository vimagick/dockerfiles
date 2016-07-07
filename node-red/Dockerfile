#
# Dockerfile for node-red
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apk add --no-cache bash \
                          build-base \
                          nodejs \
                          python \
                          python-dev \
    && npm install -g node-red \
                      node-red-admin \
    && apk del build-base \
               python-dev \
    && rm -rf /tmp/npm-*

WORKDIR /root/.node-red
VOLUME /root/.node-red

EXPOSE 1880

CMD ["node-red"]
