#
# Dockerfile for luigi
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

ENV LUIGI_HOME_DIR=/opt/luigi
ENV LUIGI_CONFIG_PATH=/opt/luigi/etc/luigi.cfg
ENV LUIGI_LOG_DIR=/opt/luigi/log
ENV LUIGI_STATE_PATH=/opt/luigi/var/state.pickle

WORKDIR $LUIGI_HOME_DIR

RUN set -xe \
    && apk add --no-cache python3 \
    && pip3 install --no-cache-dir luigi \
    && mkdir -p etc log run var \
    && touch $LUIGI_CONFIG_PATH

VOLUME $LUIGI_HOME_DIR

EXPOSE 8082

CMD luigid --logdir $LUIGI_LOG_DIR \
           --state-path $LUIGI_STATE_PATH
