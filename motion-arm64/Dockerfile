#
# Dockerfile for motion-arm
#

FROM debian:bullseye
MAINTAINER EasyPi Software Foundation

ARG MOTION_VERSION=4.4.0
ARG MOTION_CODENAME=bullseye
ARG MOTION_FILE=${MOTION_CODENAME}_motion_${MOTION_VERSION}-1_arm64.deb
ARG MOTION_URL=https://github.com/Motion-Project/motion/releases/download/release-${MOTION_VERSION}/${MOTION_FILE}

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl mosquitto-clients openssh-client \
    && curl -sSL ${MOTION_URL} -o ${MOTION_FILE} \
    && (dpkg -i ${MOTION_FILE} || apt-get -f install -y) \
    && sed -i -e 's/^daemon on/daemon off/' \
              -e 's/^webcontrol_localhost on/webcontrol_localhost off/' \
              -e 's/^stream_localhost on/stream_localhost off/' \
              -e 's/^output_pictures on/output_pictures off/' \
              /etc/motion/motion.conf \
    && rm -rf ${MOTION_FILE} /var/lib/apt/lists/*

VOLUME /var/lib/motion
WORKDIR /var/lib/motion

EXPOSE 8080 8081

ENTRYPOINT ["motion"]
