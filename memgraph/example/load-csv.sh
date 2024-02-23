#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

FILE=$(date -d yesterday +%F).csv.gz
SRC_FILE=/data/dns/data/$FILE
DST_FILE=/path/to/dns.csv.gz

echo "$(date +%FT%T) GET $FILE"
scp elk-us:$SRC_FILE $DST_FILE

echo "$(date +%FT%T) LOAD CSV"
docker exec -i memgraph_memgraph_1 mgconsole < load-csv.cql

echo "$(date +%FT%T) DONE"
