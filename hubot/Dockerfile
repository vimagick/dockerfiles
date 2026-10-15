#
# Dockerfile for hubot
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

ARG HUBOT_NAME=Hubot
ARG HUBOT_ADAPTER=slack
ARG HUBOT_DESCRIPTION=$HUBOT_NAME-$HUBOT_ADAPTER

ENV HUBOT_LOG_LEVEL=info
ENV HUBOT_SLACK_TOKEN=
ENV REDIS_URL=redis://redis:6379
ENV PATH=/home/hubot/node_modules/.bin:$PATH

RUN set -xe \
    && apk add --update bash ca-certificates git nodejs npm python3 \
    && npm install -g yo generator-hubot \
    && adduser -s /bin/bash -D hubot

USER hubot
WORKDIR /home/hubot

RUN set -xe \
    && yo hubot --name $HUBOT_NAME \
                --description $HUBOT_DESCRIPTION \
                --adapter $HUBOT_ADAPTER \
                --defaults
    && npm install --save hubot-$HUBOT_ADAPTER \
                          hubot-redis-brain \
                          htmlparser \
                          moment \
                          querystring \
                          soupselect \
                          underscore \
                          underscore.string \
                          url \
    && npm cache clean --force

VOLUME /home/hubot \
       /usr/local/bin \
       /usr/lib/python3.14/site-packages

EXPOSE 8080

CMD ["./bin/hubot", "--adapter", "slack"]
