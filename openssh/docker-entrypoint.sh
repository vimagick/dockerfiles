#!/bin/sh

cd /root/.ssh

if [ -d keys ]
then
    cat keys/*.pub > authorized_keys
fi

ssh-keygen -A

exec /usr/sbin/sshd -D "$@"
