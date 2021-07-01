#
# Dockerfile for ndscheduler
#

FROM python:2-alpine
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache bash sqlite \
    && pip install --no-cache-dir ndscheduler requests

WORKDIR /opt/ndscheduler
VOLUME /opt/ndscheduler

EXPOSE 8888

CMD ["python", "-c", "from ndscheduler.server.server import SchedulerServer; SchedulerServer.run()"]
