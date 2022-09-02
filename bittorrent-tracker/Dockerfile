#
# Dockerfile for bittorrent-tracker
#

FROM node:lts-alpine
MAINTAINER EasyPi Software Foundation

RUN npm install -g bittorrent-tracker

EXPOSE 8000

ENTRYPOINT ["bittorrent-tracker"]
CMD ["--port", "8000"]
