#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

HOST=${1?ip address is empty}

export TZ=Asia/Shanghai

{
echo "timestamp|host|download|upload|total"
echo "---------|----|--------|------|-----"
sqlite3 -cmd ".load /usr/local/lib/sqlean/ipaddr.so" ipfm.db <<- _SQL_
        select datetime(timestamp, 'unixepoch', 'localtime'), host, incoming, outgoing, total
        from ipfm
        where ipcontains('$HOST', host)
        order by timestamp asc;
_SQL_
} | numfmt --delimiter='|' --header=2 --to=iec --field=3- | column -t -s '|'
