#
# Dockerfile for kafka-manager
#

FROM openjdk:8
MAINTAINER kev <noreply@easypi.pro>

ENV SCALA_VERSION 2.12.8
ENV SBT_VERSION 1.2.8
ENV KAFKA_MANAGER_VERSION 2.0.0.2

RUN set -xe \
    && apt update \
    && wget https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.deb -O scala.deb \
    && wget https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb -O sbt.deb \
    && dpkg -i scala.deb sbt.deb \
    && rm scala.deb sbt.deb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/kafka-manager

RUN set -xe \
    && mkdir src \
    && curl -sSL https://github.com/yahoo/kafka-manager/archive/$KAFKA_MANAGER_VERSION.tar.gz | tar xz --strip 1 -C src \
    && cd src \
    && sbt clean universal:packageZipTarball \
    && cd .. \
    && tar xzf src/target/universal/kafka-manager-$KAFKA_MANAGER_VERSION.tgz --strip 1 \
    && rm -rf src

VOLUME /opt/kafka-manager/conf

EXPOSE 9000

ENTRYPOINT ["bin/kafka-manager"]
CMD ["-Dconfig.file=conf/application.conf", "-Dhttp.port=9000"]
