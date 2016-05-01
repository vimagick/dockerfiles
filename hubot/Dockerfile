#
# Dockerfile for hubot
#

FROM node:slim
MAINTAINER kev <noreply@easypi.info>

ENV HUBOT_NAME=hubot
ENV HUBOT_ADAPTER=slack
ENV HUBOT_DESCRIPTION=$HUBOT_NAME-$HUBOT_ADAPTER
ENV HUBOT_SLACK_TOKEN=

RUN set -xe \
    && npm install -g coffee-script \
                      generator-hubot \
                      hubot \
                      yo \
    && useradd -m -s /bin/bash hubot

USER hubot
WORKDIR /home/hubot

RUN set -xe \
    && yo hubot --name $HUBOT_NAME \
                --description $HUBOT_DESCRIPTION \
                --adapter $HUBOT_ADAPTER \
                --defaults \
    && npm install hubot-$HUBOT_ADAPTER --save \
    && sed -i -r 's/^\s+#//' scripts/example.coffee

VOLUME /home/hobot

CMD ["./bin/hubot", "--adapter", "slack"]
