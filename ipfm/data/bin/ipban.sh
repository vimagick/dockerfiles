#!/bin/bash

set -euo pipefail

action=${1:?action is required}
ip=${2:?ip is required}

case "$action" in
  add)
    if ipset test blacklist "$ip" 2>/dev/null; then
      echo "$ip already in blacklist"
    else
      ipset add blacklist "$ip"
      echo "$ip added to blacklist"
    fi
    ;;
  del)
    if ipset test blacklist "$ip" 2>/dev/null; then
      ipset del blacklist "$ip"
      echo "$ip removed from blacklist"
    else
      echo "$ip not in blacklist"
    fi
    ;;
  test)
    ipset test blacklist "$ip"
    ;;
  *)
    echo "usage: $0 {add|del|test} ip" >&2
    exit 1
    ;;
esac
