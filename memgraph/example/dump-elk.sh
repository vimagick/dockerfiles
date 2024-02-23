#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

export PATH=/usr/local/bin:$PATH

date=${1:-$(date -d yesterday +%F)}
url=http://127.0.0.1:9200/
index=logstash-${date//-/.}
output=data/${date}.csv

mkdir -p ${output%/*}

elastic-query-export -c $url -i $index -o $output -q '+project:dns -_exists_:message +type:(A CNAME)' -fields '@timestamp,region,client,server,type,query,answer,ttl'

gzip $output
