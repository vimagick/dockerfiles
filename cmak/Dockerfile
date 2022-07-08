#
# Dockerfile for cmak
#

FROM debian:bullseye
MAINTAINER EasyPi Software Foundation

ARG SCALA_VERSION=2.12.16
ARG SBT_VERSION=1.6.2
ARG CMAK_VERSION=3.0.0.6

RUN set -xe \
    && apt update \
    && apt install -y openjdk-11-jre-headless curl wget \
    && wget -q https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.deb -O scala.deb \
    && wget -q https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb -O sbt.deb \
    && dpkg -i scala.deb sbt.deb \
    && rm scala.deb sbt.deb \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/cmak

RUN set -xe \
    && mkdir src \
    && curl -sSL https://github.com/yahoo/CMAK/archive/$CMAK_VERSION.tar.gz | tar xz --strip 1 -C src \
    && cd src \
    && sbt clean universal:packageZipTarball \
    && cd .. \
    && tar xzf src/target/universal/cmak-$CMAK_VERSION.tgz --strip 1 \
    && rm -rf src

VOLUME /opt/cmak/conf

EXPOSE 9000

ENTRYPOINT ["bin/cmak"]
CMD ["-Dconfig.file=conf/application.conf", "-Dhttp.port=9000", "-Dpidfile.path=/dev/null"]
