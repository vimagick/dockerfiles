#
# Dockerfile for urlwatch
#

FROM python:slim
LABEL maintainer="EasyPi Software Foundation"

RUN set -xe \
    && apt-get update  \
    && apt-get -y install cron \
    && find /var/lib/apt -type f -delete \
    && find /var/cache/apt -type f -delete

RUN echo '*/30 * * * * cd /root/.urlwatch && urlwatch --urls urls.yaml --config urlwatch.yaml --hooks hooks.py --cache cache.db' | crontab -

RUN set -xe \
    && pip3 install --no-cache-dir appdirs        \
                    cssselect      \
                    keyring        \
                    lxml           \
                    minidb         \
                    pyyaml         \
                    requests       \
                    chump          \
                    beautifulsoup4 \
                    pushbullet.py  \
                    urlwatch

VOLUME /root/.urlwatch
WORKDIR /root/.urlwatch

CMD ["crond", "-f", "-L", "/dev/stdout"]
