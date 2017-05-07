#
# Dockerfile for webgoat
#

FROM java:jre-alpine
MAINTAINER kev <noreply@easypi.pro>

ENV WEBGOAT_VERSION 7.0.1
ENV WEBGOAT_FILE webgoat-container-$WEBGOAT_VERSION-war-exec.jar
ENV WEBGOAT_URL https://github.com/WebGoat/WebGoat/releases/download/$WEBGOAT_VERSION/$WEBGOAT_FILE

WORKDIR /app

RUN set -xe \
    && apk add -U curl \
    && curl -sSL $WEBGOAT_URL > webgoat.jar \
    && apk del curl \
    && rm -rf /var/cache/apk/*

EXPOSE 8080

CMD ["java", "-jar", "webgoat.jar"]
