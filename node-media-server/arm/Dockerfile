#
# Dockerfile for node-media-server
#

FROM node:lts-alpine
MAINTAINER EasyPi Software Foundation

WORKDIR /opt/nms

RUN npm install node-media-server

COPY app.js /opt/nms

EXPOSE 1935 8000

ENTRYPOINT ["sh", "-c"]
CMD ["node app.js"]
