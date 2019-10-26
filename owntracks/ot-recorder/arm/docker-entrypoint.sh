#!/bin/sh

set -xe

if ! [ -d $OTR_STORAGEDIR/last ]
then
    echo "initializing ..."
    mkdir -p $OTR_STORAGEDIR/last
    chown -R owntracks:owntracks $OTR_STORAGEDIR
    ot-recorder --initialize
fi

exec ot-recorder --http-host $OTR_HTTPHOST --http-port $OTR_HTTPPORT $OTR_OPTIONS ${OTR_TOPICS:-owntracks/#}
