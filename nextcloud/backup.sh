#!/bin/bash
#
# backup userdata to aliyun oss cloud storage
#        (please run it as cron job)
#
# https://help.aliyun.com/document_detail/50452.html
#

FILES=/root/fig/nextcloud/data/data
USERS=(admin kev)

export PATH=/usr/local/bin:$PATH

cd $FILES || exit

for user in ${USERS[@]}
do
    ossutil cp -r -u $user oss://easypi/nextcloud/$user
done
