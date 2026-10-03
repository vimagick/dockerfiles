#
# Dockerfile for motion
#

FROM debian:13
MAINTAINER EasyPi Software Foundation

ARG TARGETPLATFORM
ARG MOTION_VERSION

RUN set -xe \
    && MOTION_ARCH=$(echo $TARGETPLATFORM | sed -e 's@linux@@') \
    && MOTION_FILE=trixie_motion_${MOTION_VERSION}-1_${MOTION_ARCH}.deb \
    && MOTION_URL=https://github.com/Motion-Project/motion/releases/download/release-${MOTION_VERSION}/${MOTION_FILE} \
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
