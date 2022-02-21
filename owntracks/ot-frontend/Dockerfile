#
# Dockerfile for ot-frontend-arm
#

FROM node:14 AS build
WORKDIR /usr/src/app
RUN curl -sSL https://github.com/owntracks/frontend/archive/master.tar.gz | tar xz --strip-components=1
RUN yarn install
RUN yarn build


FROM nginx:alpine
MAINTAINER EasyPi Software Foundation

COPY --from=build /usr/src/app/dist /usr/share/nginx/html
COPY --from=build /usr/src/app/docker/nginx.tmpl /etc/nginx/nginx.tmpl

ENV LISTEN_PORT=80
ENV SERVER_HOST=otrecorder
ENV SERVER_PORT=8083

EXPOSE 80

CMD set -xe \
    && envsubst '${LISTEN_PORT}:${SERVER_HOST}:${SERVER_PORT}' < /etc/nginx/nginx.tmpl > /etc/nginx/nginx.conf \
    && mkdir -p /run/nginx/ \
    && nginx -g 'daemon off;'
