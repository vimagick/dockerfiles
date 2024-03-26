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
ARG MODEL_VOICES=amy,arctic,danny,hfc_female,hfc_male,joe,kathleen,kristin,kusal,l2arctic,lessac,libritts,libritts_r,ljspeech,ryan
ARG MODEL_QUALITY=medium

WORKDIR /opt/piper

RUN set -xe \
 && apt update -y \
 && apt install -y curl \
 && curl -sSL ${PIPER_URL} | tar xz --strip 1 \
 && mkdir models \
 && cd models \
 && echo ${MODEL_VOICES} | tr ',' '\n' | while read voice; \
    do \
      model_url=${MODEL_BASE_URL}/${voice}/${MODEL_QUALITY}/en_US-${voice}-${MODEL_QUALITY}.onnx; \
      curl -sSL -O ${model_url} -O ${model_url}.json; \
    done \
 && cd .. \
 && ./piper --version \
 && apt remove -y curl \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/opt/piper/piper"]
CMD ["-m", "/opt/piper/models/en_US-lessac-medium.onnx", "-d", "/tmp"]
