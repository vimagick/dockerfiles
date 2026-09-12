#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

export BKT_TTL=30d
export TZ=Asia/Shanghai
export PATH=/usr/local/bin:/sbin:$PATH

{
echo -e "\u001b[30mhost\u001b[0m|total|province|city|type|isp|risk|score"
echo -e "\u001b[30m----\u001b[0m|-----|--------|----|----|---|----|-----"
./sqlite3 ipfm.db <<- _SQL_ |
        WITH x AS (
          SELECT
            host,
            timestamp,
            total,
            SUM(total) OVER win1 AS sum3,
            AVG(total) OVER win1 AS avg3
          FROM ipfm
          WHERE datetime(timestamp, 'unixepoch', 'localtime') > datetime('now', '-1 day', 'localtime')
          WINDOW win1 AS (PARTITION BY host ORDER BY timestamp ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
          ORDER BY host, timestamp
        )
        SELECT host, sum(total) AS total
        FROM x
        GROUP BY host
        HAVING MAX(sum3) > 2*1024*1024*1024
        ORDER BY total DESC;
_SQL_
  while IFS='|' read host total
  do
    prov_city_isp=$(bkt --discard-failures -- curl -sf -A Mozilla/5.0 -e https://qifu.baidu.com/ https://qifu.baidu.com/api/v1/ip-portrait/brief-info?ip=$host | jq -r '.data|"\(.province)|\(.city//.province)|\(.scene)|\(.isp|gsub("中国";"")|gsub("China Mobile.*";"移动"))|\(.risk_score)|\(.security_risks|map(length)|add)"')
    evil=$(ipset test blacklist $host >/dev/null 2>&1 && echo YES)
    good=$(ipset test whitelist $host >/dev/null 2>&1 && echo YES)
    norm=$(ipset test blacklist $host >/dev/null 2>&1 || ipset test whitelist $host >/dev/null 2>&1 || echo YES)
    echo -e "${norm:+\u001b[30m}${good:+\u001b[31m}${evil:+\u001b[41m}$host\u001b[0m|$total|$prov_city_isp"
  done
} | numfmt --delimiter='|' --header=2 --to=iec --field=2 | column -n -t -s '|'
