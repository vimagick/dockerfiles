#
# Dockerfile for demucs
#

FROM continuumio/anaconda3:2020.11

USER root

WORKDIR /opt/demucs

ENV PATH=/opt/conda/bin:$PATH

RUN set -xe \
    && apk add --no-cache curl tar \
    && curl -sSL https://github.com/facebookresearch/demucs/archive/master.tar.gz | tar xz --strip 1 \
    && conda env update -f environment-cpu.yml

VOLUME /opt/demucs/models \
       /opt/demucs/output \
       /opt/demucs/input

ENTRYPOINT [ \
    "conda", "run", "--no-capture-output", "-n", "demucs", \
    "python3", "-m", "demucs.separate", "--dl", "-n", "demucs", "-d", "cpu", "--models", "models", "--out", "output" \
]
