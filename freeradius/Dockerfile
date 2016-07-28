#
# Dockerfile for freeradius
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apk add --no-cache freeradius \
                          freeradius-mysql \
                          freeradius-radclient \
    && rm -f /etc/raddb/mods-enabled/eap \
    && ln -s /etc/raddb/mods-available/sql /etc/raddb/mods-enabled/sql \
    && sed -i -e 's@driver =.*@driver = "rlm_sql_mysql"@' \
              -e 's@dialect =.*@dialect = "mysql"@' \
              -e '/Connection info:/,/^$/{s@^#@@;s@localhost@mysql@}' \
              /etc/raddb/mods-available/sql

VOLUME /etc/raddb

EXPOSE 1812/udp 1813/udp

CMD ["radiusd", "-fl", "stdout"]
