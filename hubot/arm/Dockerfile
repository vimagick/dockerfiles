#
# Dockerfile for hubot-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

ENV HUBOT_NAME=Hubot
ENV HUBOT_ADAPTER=slack
ENV HUBOT_DESCRIPTION=$HUBOT_NAME-$HUBOT_ADAPTER
ENV HUBOT_SLACK_TOKEN=

RUN set -xe \
    && apk add --update ca-certificates nodejs nodejs-npm \
    && npm install -g yo generator-hubot \
    && adduser -s /bin/sh -D hubot

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

VOLUME /home/hobot
EXPOSE 8080

CMD ["./bin/hubot", "--adapter", "slack"]
