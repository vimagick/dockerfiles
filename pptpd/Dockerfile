#
# Dockerfile for pptpd
#
# WARNING: I ONLY WORKS IN NET:HOST MODE
#

FROM debian:jessie
MAINTAINER kev<noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y iptables pptpd \
    && rm -rf /var/lib/apt/lists/*

COPY pptpd.conf    /etc/
COPY chap-secrets  /etc/ppp/
COPY pptpd-options /etc/ppp/

CMD ["pptpd", "--fg"]
