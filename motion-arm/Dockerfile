#
# Dockerfile for motion-arm
#

FROM arm32v7/debian:buster
MAINTAINER EasyPi Software Foundation

ENV MOTION_VERSION=4.3.1
ENV MOTION_FILE=pi_buster_motion_${MOTION_VERSION}-1_armhf.deb
ENV MOTION_URL=https://github.com/Motion-Project/motion/releases/download/release-${MOTION_VERSION}/${MOTION_FILE}

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl gnupg mosquitto-clients openssh-client \
    && echo "deb http://archive.raspberrypi.org/debian/ buster main" > /etc/apt/sources.list.d/raspi.list \
    && curl -sSL "http://archive.raspberrypi.org/debian/raspberrypi.gpg.key" | apt-key add - \
    && apt-get update \
    && apt-get install -y libraspberrypi0 \
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
