#!/bin/bash

set -euo pipefail

# pwgen 12 1

NAME=${1:?name is empty}

SERVER="127.0.0.1:9443"
CIPHER="chacha20-ietf-poly1305"
SECRET=$(yq -o json config.yml | jq -e -r --arg name "$NAME" '.keys[]|select(.id==$name).secret')
DIGEST=$(echo -n "$CIPHER:$SECRET" | base64 | sed 's/=*$//')

echo "ss://$DIGEST@$SERVER/?outline=1"
