#
# Dockerfile for snort
#

FROM centos:8
MAINTAINER EasyPi Software Foundation

ENV SNORT_VERSION=2.9.18
ENV SNORT_URL=https://www.snort.org/downloads/snort/snort-${SNORT_VERSION}-1.centos8.x86_64.rpm
ENV RULES_URL=https://www.snort.org/downloads/community/community-rules.tar.gz

RUN set -xe \
    && yum -y install epel-release jq libdnet \
    && yum -y install ${SNORT_URL} \
    && mkdir -p /etc/snort/rules \
    && curl -sSL ${RULES_URL} | \
       tar xz --strip 1 -C /etc/snort/rules/ community-rules/community.rules \
    && touch /etc/snort/rules/local.rules \
             /etc/snort/rules/black_list.rules \
             /etc/snort/rules/white_list.rules \
    && mkdir -p /etc/snort/so_rules \
                /etc/snort/preproc_rules \
                /usr/local/lib/snort_dynamicrules \
    && ln -s /usr/lib64/libdnet.so.1 /usr/local/lib/libdnet.1 \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install --no-cache-dir idstools \
    && yum clean all

COPY data/snort.conf /etc/snort/snort.conf
COPY data/u2json.conf /etc/snort/u2json.conf

ENTRYPOINT ["snort"]
CMD ["--help"]
