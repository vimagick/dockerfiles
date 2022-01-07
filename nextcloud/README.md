nextcloud
=========

:warning: IT'S DEPRECATED! PLEASE USE OFFICIAL DOCKER IMAGE: [nextcloud](https://hub.docker.com/_/nextcloud/)

[Nextcloud][1] puts your data at your fingertips, under your control.

## Server Setup

```bash
$ docker-compose up -d

$ docker-compose exec -u www-data nextcloud ./occ files:scan --all
Starting scan for user 1 out of 1 (admin)
+---------+-------+--------------+
| Folders | Files | Elapsed time |
+---------+-------+--------------+
| 10      | 21    | 00:00:00     |
+---------+-------+--------------+

$ crontab -l
0 * * * * docker exec -u www-data nextcloud_nextcloud_1 ./occ files:scan --all
```

You can use the [occ][2] admin tool.

## Client Setup

- Android: <https://download.nextcloud.com/android/>
- MacOSX: <https://download.nextcloud.com/desktop/releases/Mac/Installer/>
- Windows: <https://download.nextcloud.com/desktop/releases/Windows/>

[1]: https://nextcloud.com/
[2]: https://docs.nextcloud.com/server/9/admin_manual/configuration_server/occ_command.html
