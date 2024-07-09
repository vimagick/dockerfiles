#
# Dockerfile for flashmq
#

FROM debian:12
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apt update -y \
 && apt install -y ca-certificates curl gpg \
 && update-ca-certificates -f \
 && curl -sSL https://www.flashmq.org/wp-content/uploads/2021/10/flashmq-repo.gpg \
    | gpg --dearmor \
    | tee /usr/share/keyrings/flashmq-repo.gpg > /dev/null \
 && echo 'deb [signed-by=/usr/share/keyrings/flashmq-repo.gpg] http://repo.flashmq.org/apt bookworm main' \
    | tee /etc/apt/sources.list.d/flashmq.list \
 && apt update -y \
 && apt download -y flashmq \
 && dpkg -c flashmq_*.deb \
 && dpkg -x flashmq_*.deb flashmq \
 && mv flashmq/usr/bin/flashmq /usr/bin/ \
 && flashmq --version \
 && apt remove -y curl gpg \
 && rm -rf /var/lib/apt/lists/* flashmq_*.deb flashmq

EXPOSE 1883

ENTRYPOINT ["flashmq"]
CMD ["--config-file", "/etc/flashmq/flashmq.conf"]
