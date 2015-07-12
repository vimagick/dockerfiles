#
# Dockerfile for youtube-worker
#

FROM alpine
MAINTAINER kev <noreplay@datageek.info>

RUN apk add -U ca-certificates py-pip \
    && rm -rf /var/cache/apk/* \
    && pip install redis youtube-dl

COPY worker.py /code/
VOLUME /data
WORKDIR /data

CMD ["python", "/code/worker.py"]
