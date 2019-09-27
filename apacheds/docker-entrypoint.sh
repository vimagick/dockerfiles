#!/bin/sh

set -e

if ! [ -d ${APACHEDS_INSTANCE_DIR} ]; then
    cp -r ${APACHEDS_DATA}-${APACHEDS_VERSION}/default ${APACHEDS_INSTANCE_DIR}
    chown -R ${APACHEDS_USER}:${APACHEDS_GROUP} ${APACHEDS_INSTANCE_DIR}
fi

gosu ${APACHEDS_USER} /opt/apacheds-${APACHEDS_VERSION}/bin/apacheds start ${APACHEDS_INSTANCE}

tail -n 0 -f ${APACHEDS_INSTANCE_DIR}/log/apacheds.log
