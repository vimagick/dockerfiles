#
# Dockerfile for red5-arm
#

FROM armhf/debian:jessie
MAINTAINER EasyPi Software Foundation

ENV RED5_VERSION 1.0.9
ENV RED5_FILE red5-server-${RED5_VERSION}-RELEASE.tar.gz
ENV RED5_URL https://github.com/Red5/red5-server/releases/download/v${RED5_VERSION}-RELEASE/${RED5_FILE}

WORKDIR /opt/red5

RUN set -xe \
    && echo 'deb http://httpredir.debian.org/debian jessie-backports main' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y ca-certificates-java \
                          curl \
                          openjdk-8-jre-headless \
    && /var/lib/dpkg/info/ca-certificates-java.postinst configure \
    && curl -sSL ${RED5_URL} | tar xz --strip 1 \
    && apt-get remove -y curl \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-armhf/jre
ENV PATH $PATH:$JAVA_HOME/bin

EXPOSE 843 1935 5080 5443 8081 8443

ENTRYPOINT ["./red5.sh"]
