#
# Dockerfile for bittorrent-tracker
#

FROM node:lts-alpine
MAINTAINER EasyPi Software Foundation

RUN npm install -g bittorrent-tracker

EXPOSE 8000/tcp 8000/udp

ENTRYPOINT ["bittorrent-tracker"]
CMD ["--port", "8000"]
