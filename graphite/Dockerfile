#
# Dockerfile for graphite
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ENV GRAPHITE_VERSION=1.1.10
ENV GRAPHITE_CONF_DIR=/opt/graphite/conf
ENV GRAPHITE_STORAGE_DIR=/opt/graphite/storage
ENV DJANGO_SETTINGS_MODULE=graphite.settings
ENV PATH=/opt/graphite/bin:$PATH
ENV PYTHONPATH=/opt/graphite/lib:/opt/graphite/webapp

WORKDIR /opt/graphite

RUN set -xe \
    && apk update \
    && apk add build-base \
               cairo \
               curl \
               libffi-dev \
               nginx \
               python3 \
               python3-dev \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip3 install pip==20.1 \
    && pip3 install --no-cache-dir gunicorn supervisor \
    && pip3 install --no-cache-dir --install-option=--prefix=/opt/graphite \
                    --install-option=--install-lib=/opt/graphite/lib \
                    whisper==$GRAPHITE_VERSION \
                    carbon==$GRAPHITE_VERSION \
    && pip3 install --no-cache-dir --install-option=--prefix=/opt/graphite \
                    --install-option=--install-lib=/opt/graphite/webapp \
                    graphite-web==$GRAPHITE_VERSION \
    && pip3 install pyparsing==2.4.7 \
    && cd ./webapp \
    && echo "SECRET_KEY = '$(head -c 16 /dev/urandom | base64)'" >> graphite/local_settings.py \
    && cd ../conf \
    && cp carbon.conf.example carbon.conf \
    && cp storage-schemas.conf.example storage-schemas.conf \
    && cp aggregation-rules.conf.example aggregation-rules.conf \
    && cd .. \
    && django-admin collectstatic --noinput \
    && django-admin migrate --noinput --run-syncdb \
    && apk del build-base \
               curl \
               libffi-dev \
               python3-dev \
    && rm -rf /root/.cache/pip \
              /var/cache/apk/*

COPY nginx.conf /etc/nginx/http.d/default.conf
COPY supervisord.conf /etc/supervisor/

VOLUME $GRAPHITE_CONF_DIR \
       $GRAPHITE_STORAGE_DIR

EXPOSE 2003/udp \
       2003 \
       2004 \
       2023 \
       2024 \
       7002 \
       8080 \
       9001

CMD ["supervisord", "-n"]
