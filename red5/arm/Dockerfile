#
# Dockerfile for red5-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

ENV RED5_VERSION 1.0.9
ENV RED5_FILE red5-server-${RED5_VERSION}-RELEASE.tar.gz
ENV RED5_URL https://github.com/Red5/red5-server/releases/download/v${RED5_VERSION}-RELEASE/${RED5_FILE}

WORKDIR /opt/red5

RUN set -xe \
    && apk add --no-cache --progress bash curl openjdk8-jre tar \
    && curl -sSL ${RED5_URL} | tar xz --strip 1 \
    && apk del curl tar

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $PATH:$JAVA_HOME/bin

EXPOSE 843 1935 5080 5443 8081 8443

ENTRYPOINT ["./red5.sh"]
