wireguard-ui
============

[wireguard-ui][1] is a web user interface to manage your WireGuard setup.

## up and running

```bash
$ apt update
$ apt install wireguard
$ docker-compose up -d
$ curl http://127.0.0.1:5000
$ systemctl enable --now wgui.path
```

## systemd integration

```ini
# /etc/systemd/system/wgui.service

[Unit]
Description=Restart wireguard service
After=network.target

[Service]
Type=oneshot
ExecStart=/bin/systemctl restart wg-quick@wg0
```

```ini
# /etc/systemd/system/wgui.path

[Unit]
Description=Watch wireguard config

[Path]
PathModified=/etc/wireguard/wg0.conf

[Install]
WantedBy=multi-user.target
```

[1]: https://github.com/ngoduykhanh/wireguard-ui
