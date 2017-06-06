#
# Dockerfile for freeradius
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache freeradius \
                          freeradius-radclient \
                          freeradius-sqlite \
                          sqlite \
    && ln -s /etc/raddb/mods-available/sql /etc/raddb/mods-enabled/sql \
    && sed -i -e 's@driver =.*@driver = "rlm_sql_sqlite"@' \
              -e 's@dialect =.*@dialect = "sqlite"@' \
              -e '/sqlite {$/,/}$/{s@^#@@;s@/tmp@/etc/raddb@}' \
              /etc/raddb/mods-available/sql

RUN set -xe \
    && cd /etc/raddb \
    && sqlite3 freeradius.db < mods-config/sql/main/sqlite/schema.sql \
    && echo "INSERT INTO radcheck VALUES('0','user','Cleartext-Password',':=','pass');" | sqlite3 freeradius.db \
    && radiusd \
    && radtest user pass localhost 0 testing123 \
    && echo "DELETE FROM radcheck WHERE id='0';" | sqlite3 freeradius.db \
    && chown -R root:radius /etc/raddb

VOLUME /etc/raddb

EXPOSE 1812/udp \
       1813/udp \
       47132/udp

CMD ["radiusd", "-f"]
