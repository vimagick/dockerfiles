#
# Dockerfile for freeradius
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache freeradius \
                          freeradius-mysql \
                          freeradius-radclient \
                          make \
                          openssl \
    && /etc/raddb/certs/bootstrap \
    && ln -s /etc/raddb/mods-available/sql \
             /etc/raddb/mods-available/sqlcounter /etc/raddb/mods-enabled \
    && sed -i -e 's@driver =.*@driver = "rlm_sql_mysql"@' \
              -e 's@dialect =.*@dialect = "mysql"@' \
              -e '/read_clients = yes/s@^#@@' \
              -e '/Connection info:/,/^$/{s@^#@@;s@localhost@mysql@}' \
              /etc/raddb/mods-available/sql \
    && sed -i -e '/^#\t*eap$/s@^#@@' \
              -e '/^#\teap {$/,/#\t}$/s@^#@@' \
              /etc/raddb/sites-enabled/default \
    && chown -R root:radius /etc/raddb

VOLUME /etc/raddb

EXPOSE 1812/udp 1813/udp

CMD ["radiusd", "-fl", "stdout"]
