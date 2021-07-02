#
# Dockerfile for airflow
#

FROM python:3.8-alpine

ENV AIRFLOW_VERSION=1.10.11
ENV AIRFLOW_EXTRAS=async,all_dbs,celery,crypto,devel_hadoop,jdbc,ldap,password,redis,s3,samba,ssh,statsd
ENV AIRFLOW_HOME=/opt/airflow
ENV AIRFLOW_CONFIG=/opt/airflow/airflow.cfg

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
    && pip install --no-cache-dir cython numpy psycopg2-binary \
    && pip install --no-cache-dir apache-airflow[${AIRFLOW_EXTRAS}]==${AIRFLOW_VERSION} \
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
