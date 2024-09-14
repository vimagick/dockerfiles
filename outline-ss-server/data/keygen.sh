#!/bin/bash

set -euo pipefail

# pwgen -1 12 1

NAME=${1:?name is empty}
REMARK=${2:-EasyPi}
SERVER=127.0.0.1
PORT=8388
CIPHER="chacha20-ietf-poly1305"
SECRET=$(
  yq -o json config.yml |
    jq -e -r --arg name "$NAME" --arg addr "[::]:$PORT" '.services[]|select(.listeners[0].address==$addr).keys[]|select(.id==$name).secret'
)
DIGEST=$(echo -n "$CIPHER:$SECRET" | base64 | sed 's/=*$//')

echo "ss://$DIGEST@$SERVER:$PORT/?outline=1#$REMARK"
