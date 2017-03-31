#!/bin/sh

set -xe

if ! [ -d $OTR_STORAGEDIR/last ]
then
    echo "initializing ..."
    ot-recorder --initialize
    mkdir -p $OTR_STORAGEDIR/last
fi

chown -R owntracks:owntracks $OTR_STORAGEDIR

exec ot-recorder --http-host 0.0.0.0 $OTR_TOPICS
