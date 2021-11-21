#
# Dockerfile for mqtt-io-arm
#

FROM debian:bullseye

RUN set -xe \
 && apt update -y \
 && apt install -y python3 python3-pip python3-rpi.gpio \
 && pip3 install --no-cache mqtt-io \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD ["python3", "-m", "mqtt_io", "config.yml"]
