#
# Dockerfile for airflow
#

FROM python:3.7-alpine

ENV AIRFLOW_VERSION=1.10.5
ENV AIRFLOW_EXTRAS=async,all_dbs,celery,crypto,devel_hadoop,jdbc,ldap,password,redis,s3,samba,slack,ssh,statsd
ENV AIRFLOW_HOME=/opt/airflow
ENV AIRFLOW_CONFIG=airflow.cfg

ARG FERNET_KEY=4XHGZH0dZ40iOv6z5cyfrXVg5qg3s_d06A7BFfbSsqA=
ENV FERNET_KEY=${FERNET_KEY}

RUN set -xe \
    && apk add --no-cache \
        build-base \
        cyrus-sasl-dev \
        freetds \
        freetds-dev \
        krb5-dev \
        libffi-dev \
        mariadb-dev \
        postgresql-dev \
        python3-dev \
    && pip install cython numpy \
    && pip install apache-airflow[${AIRFLOW_EXTRAS}]==${AIRFLOW_VERSION} \
    && pip install "websocket-client<0.55.0,>=0.35" \
    && apk del \
        build-base \
        cyrus-sasl-dev \
        freetds-dev \
        krb5-dev \
        libffi-dev \
        mariadb-dev \
        postgresql-dev \
        python3-dev \
    && rm -rf /root/.cache/pip

WORKDIR ${AIRFLOW_HOME}
VOLUME ${AIRFLOW_HOME}

EXPOSE 8080

ENTRYPOINT ["airflow"]
CMD ["--help"]
