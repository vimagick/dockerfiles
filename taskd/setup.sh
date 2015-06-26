#!/bin/bash
#
# setup taskd server
#

mkdir -p ~/fig/taskd/taskd/{orgs,users}
cd ~/fig/taskd/taskd/

wget -O- http://taskwarrior.org/download/taskd-1.1.0.tar.gz |
    tar xvz --strip 1 taskd-1.1.0/pki

cd pki
vim vars
./generate
./generate.client kev
mv kev.* ../users
mv *.pem ..
cd ..

cat > config << _EOF_
confirmation=1
extensions=/usr/libexec/taskd
ip.log=on
log=/dev/stdout
pid.file=/run/taskd.pid
queue.size=10
request.limit=1048576
root=/var/taskd
server=0.0.0.0:53589
trust=strict
verbose=1
client.cert=/var/taskd/client.cert.pem
client.key=/var/taskd/client.key.pem
server.cert=/var/taskd/server.cert.pem
server.key=/var/taskd/server.key.pem
server.crl=/var/taskd/server.crl.pem
ca.cert=/var/taskd/ca.cert.pem
_EOF_
