#
# Dockerfile for ndscheduler
#

FROM python:2-alpine
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache sqlite \
    && pip install ndscheduler requests \
    && rm -f /usr/local/lib/python2.7/site-packages/simple_scheduler/jobs/apns_job.py*

WORKDIR /opt/ndscheduler
VOLUME /opt/ndscheduler

EXPOSE 8888

ENV NDSCHEDULER_SETTINGS_MODULE=simple_scheduler.settings

CMD ["python", "-c", "from ndscheduler.server.server import SchedulerServer; SchedulerServer.run()"]
