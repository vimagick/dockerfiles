#
# Dockerfile for openhab
#

FROM java:jre-alpine
MAINTAINER kev <noreply@easypi.pro>

ENV OPENHAB_VERSION 2.0.0-SNAPSHOT
ENV OPENHAB_FILE openhab-online-${OPENHAB_VERSION}.zip
ENV OPENHAB_URL https://openhab.ci.cloudbees.com/job/openHAB-Distribution/lastSuccessfulBuild/artifact/distributions/openhab-online/target/${OPENHAB_FILE}

WORKDIR /app

RUN set -xe \
    && apk add --no-cache curl \
    && curl -sSL $OPENHAB_URL > $OPENHAB_FILE \
    && unzip $OPENHAB_FILE \
    && apk del curl \
    && rm -rf $OPENHAB_FILE

VOLUME /app/conf /app/userdata /app/addons

EXPOSE 8080 8443 5555

CMD ["/app/start.sh"]
