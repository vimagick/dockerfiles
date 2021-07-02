#
# Dockerfile for youtube-worker
#

FROM alpine
MAINTAINER kev <noreplay@easypi.pro>

RUN apk add -U ca-certificates py-pip \
    && rm -rf /var/cache/apk/* \
    && pip install --no-cache-dir redis youtube-dl

COPY worker.py /code/
VOLUME /data
WORKDIR /data

CMD ["python", "/code/worker.py"]
