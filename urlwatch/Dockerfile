#
# Dockerfile for urlwatch
#

FROM python:slim
LABEL maintainer="EasyPi Software Foundation"

LABEL org.opencontainers.image.title="urlwatch"
LABEL org.opencontainers.image.description="urlwatch is a tool for monitoring webpages for updates."
LABEL org.opencontainers.image.url="https://hub.docker.com/r/vimagick/urlwatch"
LABEL org.opencontainers.image.documentation="https://hub.docker.com/r/vimagick/urlwatch"
LABEL org.opencontainers.image.source="https://www.github.com/vimagick/dockerfiles"

RUN set -xe \
    && apt-get update  \
    && apt-get -y install cron \
    && find /var/lib/apt -type f -delete \
    && find /var/cache/apt -type f -delete

RUN echo '*/30 * * * * cd /root/.urlwatch && urlwatch --urls urls.yaml --config urlwatch.yaml --hooks hooks.py --cache cache.db' | crontab -

RUN set -xe \
    && pip3 install --no-cache-dir \
                    aioxmpp        \
                    beautifulsoup4 \
                    chump          \
                    cssbeautifier  \
                    html2text      \
                    jq             \
                    jsbeautifier   \
                    keyrings.alt   \
                    markdown2      \
                    matrix_client  \
                    pushbullet.py  \
                    urlwatch

VOLUME /root/.urlwatch
WORKDIR /root/.urlwatch

CMD ["crond", "-f", "-L", "/dev/stdout"]
