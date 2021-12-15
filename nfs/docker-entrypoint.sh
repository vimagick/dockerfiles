#!/bin/bash
#
# https://github.com/janeczku/docker-nfs-ganesha/blob/master/rootfs/opt/start_nfs.sh
#

set -e

# environment variables

: ${EXPORT_PATH:="/data/nfs"}
: ${PSEUDO_PATH:="/"}
: ${EXPORT_ID:=0}
: ${PROTOCOLS:=4}
: ${TRANSPORTS:="UDP, TCP"}
: ${SEC_TYPE:="sys"}
: ${SQUASH_MODE:="No_Root_Squash"}
: ${GRACELESS:=true}
: ${VERBOSITY:="NIV_EVENT"} # NIV_DEBUG, NIV_EVENT, NIV_WARN

: ${GANESHA_CONFIG:="/etc/ganesha/ganesha.conf"}
: ${GANESHA_LOGFILE:="/dev/stdout"}

init_rpc() {
    echo "* Starting rpcbind"
    if [ ! -x /run/rpcbind ] ; then
        install -m755 -g 32 -o 32 -d /run/rpcbind
        install -m755 -g 32 -o 32 -d /run/rpc_pipefs/nfs
    fi
    rpcbind || return 0
    rpc.statd -L || return 0
    rpc.idmapd || return 0
    sleep 1
}

init_dbus() {
    echo "* Starting dbus"
    if [ ! -x /var/run/dbus ] ; then
        install -m755 -g 81 -o 81 -d /var/run/dbus
    fi
    rm -f /var/run/dbus/*
    rm -f /var/run/messagebus.pid
    dbus-uuidgen --ensure
    dbus-daemon --system --fork
    sleep 1
}

# pNFS
# Ganesha by default is configured as pNFS DS.
# A full pNFS cluster consists of multiple DS
# and one MDS (Meta Data server). To implement
# this one needs to deploy multiple Ganesha NFS
# and then configure one of them as MDS:
# GLUSTER { PNFS_MDS = ${WITH_PNFS}; }

bootstrap_config() {
    echo "* Writing configuration"
    cat <<END >${GANESHA_CONFIG}

NFSV4 {
    Graceless = ${GRACELESS};
}

EXPORT {
    Export_Id = ${EXPORT_ID};
    Path = "${EXPORT_PATH}";
    Pseudo = "${PSEUDO_PATH}";
    FSAL {
        Name = VFS;
    }
    Access_type = RW;
    Disable_ACL = true;
    Squash = ${SQUASH_MODE};
    Protocols = ${PROTOCOLS};
}

EXPORT_DEFAULTS {
    Transports = ${TRANSPORTS};
    SecType = ${SEC_TYPE};
}

END
}

sleep 0.5

if [ ! -f ${EXPORT_PATH} ]; then
    mkdir -p "${EXPORT_PATH}"
fi

echo "Initializing Ganesha NFS server"
echo "=================================="
echo "export path: ${EXPORT_PATH}"
echo "=================================="

bootstrap_config
init_rpc
init_dbus

echo "Generated NFS-Ganesha config:"
cat ${GANESHA_CONFIG}

echo "* Starting Ganesha-NFS"
exec /usr/bin/ganesha.nfsd -F -L ${GANESHA_LOGFILE} -f ${GANESHA_CONFIG} -N ${VERBOSITY}
