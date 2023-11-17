#
# Dockerfile for hubot
#

FROM alpine:3.18
MAINTAINER EasyPi Software Foundation

ENV HUBOT_NAME=Hubot
ENV HUBOT_ADAPTER=slack
ENV HUBOT_DESCRIPTION=$HUBOT_NAME-$HUBOT_ADAPTER
ENV HUBOT_LOG_LEVEL=info
ENV HUBOT_SLACK_TOKEN=

ENV PATH=/home/hubot/node_modules/.bin:$PATH

RUN set -xe \
    && apk add --update bash ca-certificates nodejs npm python3 \
    && npm install -g yo generator-hubot \
    && adduser -s /bin/bash -D hubot

USER hubot
WORKDIR /home/hubot

RUN set -xe \
    && yo hubot --name $HUBOT_NAME \
                --description $HUBOT_DESCRIPTION \
                --adapter $HUBOT_ADAPTER \
                --defaults \
    && npm install --save hubot-$HUBOT_ADAPTER \
                          htmlparser \
                          moment \
                          querystring \
                          soupselect \
                          underscore \
                          underscore.string \
                          url \
    && sed -i -r 's/^\s+#//' scripts/example.coffee

VOLUME /home/hobot \
       /usr/local/bin \
       /usr/lib/python3.11/site-packages

EXPOSE 8080

CMD ["./bin/hubot", "--adapter", "slack"]
