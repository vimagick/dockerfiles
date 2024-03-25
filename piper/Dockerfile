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

ARG MODEL_BASE_URL=https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US
ARG MODEL_URL_1=${MODEL_BASE_URL}/amy/medium/en_US-amy-medium.onnx
ARG MODEL_URL_2=${MODEL_BASE_URL}/joe/medium/en_US-joe-medium.onnx
ARG MODEL_URL_3=${MODEL_BASE_URL}/kristin/medium/en_US-kristin-medium.onnx
ARG MODEL_URL_4=${MODEL_BASE_URL}/lessac/medium/en_US-lessac-medium.onnx
ARG MODEL_URL_5=${MODEL_BASE_URL}/lessac/ryan/en_US-ryan-medium.onnx

WORKDIR /opt/piper

RUN set -xe \
 && apt update -y \
 && apt install -y curl \
 && curl -sSL ${PIPER_URL} | tar xz --strip 1 \
 && curl -sSL -O ${MODEL_URL_1} -O ${MODEL_URL_1}.json \
              -O ${MODEL_URL_2} -O ${MODEL_URL_2}.json \
              -O ${MODEL_URL_3} -O ${MODEL_URL_3}.json \
              -O ${MODEL_URL_4} -O ${MODEL_URL_4}.json \
              -O ${MODEL_URL_5} -O ${MODEL_URL_5}.json \
 && ./piper --version \
 && apt remove -y curl \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["./piper", "-m", "en_US-lessac-medium.onnx", "-d", "/tmp"]
