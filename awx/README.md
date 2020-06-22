awx
===

[AWX][1] provides a web-based user interface, REST API, and task engine built
on top of Ansible. It is the upstream project for [Tower][2], a commercial
derivative of AWX.

## directory tree

```
data
├── projects
│   └── example
│       └── playbook.yml
├── redis
│   ├── redis_socket (mode:777)
│   └── redis.conf
└── settings
    ├── SECRET_KEY
    ├── credentials.py
    ├── environment.sh
    └── nginx.conf
```

## up and running

```bash
$ mkdir -m 777 -p data/redis/redis_socket
$ docker-compose up -d
$ docker-compose exec web bash
>>> awx-manage inventory_import --inventory-name=xxx --source=/path/to/inventory.ini
INFO     Reading Ansible inventory source: /path/to/inventory.ini
INFO     Loaded 1 groups, 30 hosts
INFO     Inventory import completed for  (xxx - 13) in 1.0s
>>> chown -R nginx:nginx /var/lib/nginx # XXX: https://github.com/ansible/awx/issues/5230
>>> exit
$ curl http://admin:password@127.0.0.1:8052
```

[1]: https://github.com/ansible/awx
[2]: https://www.ansible.com/tower
