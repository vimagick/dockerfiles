#
# Dockerfile for snort
#

FROM centos:7
MAINTAINER kev <noreply@easypi.pro>

ENV DAQ_VERSION 2.0.6
ENV SNORT_VERSION 2.9.13
ENV BASE_URL https://www.snort.org/downloads

RUN set -xe \
    && yum -y install epel-release libdnet \
    && yum -y install ${BASE_URL}/snort/daq-${DAQ_VERSION}-1.centos7.x86_64.rpm \
                      ${BASE_URL}/snort/snort-${SNORT_VERSION}-1.centos7.x86_64.rpm \
    && mkdir -p /etc/snort/rules \
    && curl -sSL ${BASE_URL}/community/community-rules.tar.gz | \
       tar xz --strip 1 -C /etc/snort/rules/ community-rules/community.rules \
    && touch /etc/snort/rules/local.rules \
             /etc/snort/rules/black_list.rules \
             /etc/snort/rules/white_list.rules \
    && mkdir -p /etc/snort/so_rules \
                /etc/snort/preproc_rules \
                /usr/local/lib/snort_dynamicrules \
    && ln -s /usr/lib64/libdnet.so.1 /usr/local/lib/libdnet.1 \
    && yum clean all

COPY data/snort.conf /etc/snort/snort.conf

ENTRYPOINT ["snort"]
CMD ["--help"]
