#
# Dockerfile for graphite-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

ENV PATH=$PATH:/opt/graphite/bin
ENV PYTHONPATH=/opt/graphite/lib:/opt/graphite/webapp
ENV GRAPHITE_CONF_DIR=/opt/graphite/conf
ENV GRAPHITE_STORAGE_DIR=/opt/graphite/storage

WORKDIR /opt/graphite

RUN set -xe \
    && apk update \
    && apk add build-base \
               cairo \
               curl \
               git \
               libffi-dev \
               python \
               python-dev \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install gunicorn \
                   supervisor \
                   https://github.com/graphite-project/whisper/tarball/master \
                   https://github.com/graphite-project/carbon/tarball/master \
                   https://github.com/graphite-project/graphite-web/tarball/master \
                -r https://github.com/graphite-project/graphite-web/raw/master/requirements.txt \
    && cd conf \
    && cp carbon.conf.example carbon.conf \
    && cp storage-schemas.conf.example storage-schemas.conf \
    && cd ../webapp \
    && echo "SECRET_KEY = '$(head -c 16 /dev/urandom | base64)'" > graphite/local_settings.py \
    && curl -sSL https://github.com/graphite-project/graphite-web/raw/master/webapp/manage.py > manage.py \
    && chmod +x manage.py \
    && python manage.py migrate --run-syncdb --noinput \
    && apk del build-base \
               curl \
               git \
               libffi-dev \
               python-dev \
    && rm -rf /root/.cache/pip \
              /var/cache/apk/*

COPY supervisord.conf /etc/supervisor/

VOLUME $GRAPHITE_CONF_DIR \
       $GRAPHITE_STORAGE_DIR

EXPOSE 2003 \
       2004 \
       7002 \
       8080 \
       9001

CMD ["supervisord", "-n"]
