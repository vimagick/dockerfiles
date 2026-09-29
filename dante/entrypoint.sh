#!/bin/sh

set -e

CFGFILE="${CFGFILE:-/etc/dante/sockd.conf}"
PIDFILE="${PIDFILE:-/run/sockd.pid}"
WORKERS="${WORKERS:-10}"

exec sockd -f "$CFGFILE" -p "$PIDFILE" -N "$WORKERS"
