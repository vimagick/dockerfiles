#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

date=${1:-$(date +%F)}
hour=${2:-$(date +%H)}
timestamp=$(date -d "${date}T$hour:00:00" +%s)
path=/var/log/ipfm/$date/$hour-00.txt
dbfile=ipfm.db

if ! [[ -e $path ]]; then
  exit 1
fi

sqlite3 $dbfile << _SQL_
CREATE TABLE IF NOT EXISTS ipfm
(
  timestamp INT,
  host TEXT,
  incoming INT,
  outgoing INT,
  total INT,
  UNIQUE (timestamp, host)
);
_SQL_

awk -vOFS=, -v timestamp="$timestamp" '
  !/^#/ && $4>10*1024**2 {
    host=$1; inbound=$2; outbound=$3; total=$4;
    print timestamp, host, inbound, outbound, total;
  }' $path | sqlite3 -csv $dbfile ".import '|cat -' ipfm"
