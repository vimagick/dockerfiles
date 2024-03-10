#
# Dockerfile for piper
#

FROM debian:12
MAINTAINER EasyPi Software Foundation

ARG PIPER_VERSION=2023.11.14-2
ARG PIPER_OS=linux
ARG PIPER_ARCH=x86_64
ARG PIPER_FILE=piper_${PIPER_OS}_${PIPER_ARCH}.tar.gz
ARG PIPER_URL=https://github.com/rhasspy/piper/releases/download/${PIPER_VERSION}/${PIPER_FILE}

ARG MODEL_BASE_URL=https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/medium
ARG MODEL_FILE=en_US-lessac-medium.onnx

WORKDIR /opt/piper

RUN set -xe \
 && apt update -y \
 && apt install -y curl \
 && curl -sSL ${PIPER_URL} | tar xz --strip 1 \
 && curl -sSL -O ${MODEL_BASE_URL}/${MODEL_FILE} \
              -O ${MODEL_BASE_URL}/${MODEL_FILE}.json \
 && ./piper --version \
 && apt remove -y curl \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["./piper", "-m", "en_US-lessac-medium.onnx", "-d", "/tmp"]
