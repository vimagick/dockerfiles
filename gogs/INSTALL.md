Install Gogs On Raspberry Pi
============================

1. Install `git`.
2. Download the latest binary from [here][1].
3. Create a new user called `git`.
4. Extract `raspi2.zip` to `/home/git`.
5. Change the owner of `/home/git/gogs` to `git`.
6. Create systemd unit file `gogs.service`.
7. Start and enable `gogs.service`.
8. Create a ssh port forwarding to `3000/tcp`.
9. Open <http://localhost:3000> in web browser.

## Install

```bash
sudo su
apt install -y git
cd /tmp
wget https://github.com/gogits/gogs/releases/download/v0.9.13/raspi2.zip
mkdir -p /home/git
useradd -m -d /home/git -s /bin/bash git
unzip raspi2.zip -d /home/git/
chown -R git:git /home/git
cp /home/git/gogs/scripts/systemd/gogs.service /etc/systemd/system/
systemctl daemon-reload && systemctl start gogs && systemctl enable gogs
rm raspi2.zip
```

## Setup

In current SSH session, create a port forwarding to setup gogs.

- Press: <kbd>~C</kbd>
- Type: `-L 3000:localhost:3000`
- Open: <http://localhost:3000/install>
- Press: <kbd>~C</kbd>
- Type: `-KL3000`

[1]: https://github.com/gogits/gogs/releases
