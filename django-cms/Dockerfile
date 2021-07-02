#
# Dockerfile for django-cms
#

FROM vimagick/python:2
MAINTAINER kev <noreply@easypi.pro>

WORKDIR /app

RUN set -xe \
    && apk add -U py-pillow tzdata \
    && pip install --no-cache-dir djangocms-installer \
    && mkdir -p data \
    && djangocms --db sqlite://localhost/data/project.db \
                 --filer \
                 --languages en \
                 --no-input \
                 --parent-dir . \
                 --skip-empty-check \
                 --utc \
                 mysite

VOLUME /app/data

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
