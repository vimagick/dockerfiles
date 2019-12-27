#
# Dockerfile for tiddlywiki
#

FROM node:alpine
MAINTAINER EasyPi Software Foundation

RUN npm install -g tiddlywiki

VOLUME /data
WORKDIR /data

EXPOSE 8080

ENTRYPOINT ["tiddlywiki", ".", "--listen", "host=0.0.0.0", "port=8080"]
