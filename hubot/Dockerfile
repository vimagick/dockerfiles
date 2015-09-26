#
# Dockerfile for hubot
#

FROM node
MAINTAINER kev <noreply@datageek.info>

ENV HUBOT_NAME=hubot
ENV HUBOT_ADAPTER=slack
ENV HUBOT_DESCRIPTION=$HUBOT_NAME-$HUBOT_ADAPTER
ENV HUBOT_SLACK_TOKEN=

RUN npm install -g hubot coffee-script yo generator-hubot \
    && useradd -m -s /bin/bash hubot

USER hubot
WORKDIR /home/hubot

RUN yo hubot --name $HUBOT_NAME \
             --description $HUBOT_DESCRIPTION \
             --adapter $HUBOT_ADAPTER \
             --defaults \
    && npm install hubot-$HUBOT_ADAPTER --save \
    && sed -i -r 's/^\s+#//' scripts/example.coffee

VOLUME /home/hobot

CMD ["bin/hubot", "--adapter", "slack"]
