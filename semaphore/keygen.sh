#!/bin/bash
#
# https://docs.semui.co/administration-guide/api
#

set -euo pipefail

API_ENDPOINT=http://192.168.1.100:3000
API_USERNAME=username
API_PASSWORD=password

cookie=$(jq -n --arg auth $API_USERNAME --arg password $API_PASSWORD '{$auth, $password}' | curl -s -c- $API_ENDPOINT/api/auth/login -d @- -o /dev/null | awk '$6=="semaphore"{print $7}')

if curl -s -H "Cookie: semaphore=$cookie" $API_ENDPOINT/api/user/tokens | jq -e 'length==0' > /dev/null; then
  curl -s -X POST -H "Cookie: semaphore=$cookie" $API_ENDPOINT/api/user/tokens
fi

token=$(curl -s -H "Cookie: semaphore=$cookie" $API_ENDPOINT/api/user/tokens | jq -r .[0].id)

curl -s -H "Authorization: Bearer $token" $API_ENDPOINT/api/user/tokens | jq .
