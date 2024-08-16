#!/bin/bash

set -euo pipefail

DATE=$(date +%Y-%m)
wget -O ip-asn.mmdb.gz https://download.db-ip.com/free/dbip-asn-lite-$DATE.mmdb.gz
wget -O ip-country.mmdb.gz https://download.db-ip.com/free/dbip-country-lite-$DATE.mmdb.gz

systemctl stop outline-ss-server
gunzip -f ip-asn.mmdb.gz ip-country.mmdb.gz
systemctl start outline-ss-server
