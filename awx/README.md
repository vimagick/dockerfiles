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
└── settings
    ├── SECRET_KEY
    ├── credentials.py
    └── environment.sh
```

## up and running

```
$ docker-compose up -d
$ docker-compose exec web bash
>>> awx-manage inventory_import --inventory-name=xxx --source=/path/to/inventory.ini
INFO     Reading Ansible inventory source: /path/to/inventory.ini
INFO     Loaded 1 groups, 30 hosts
INFO     Inventory import completed for  (xxx - 13) in 1.0s
>>> exit
$ curl http://127.0.0.1:8052
```

[1]: https://github.com/ansible/awx
[2]: https://www.ansible.com/tower
