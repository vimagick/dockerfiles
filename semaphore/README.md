semaphore
=========

Ansible [Semaphore][1] is beautiful web interface for running Ansible playbooks. You do not need to change your playbooks to start using it.

## up and running

```bash
$ mkdir -m 777 data/{etc/secrets,var,tmp}
$ docker compose up -d
$ http :3000/api/ping
```

> [!Note]
> Docker Container [USER=1001](https://github.com/semaphoreui/semaphore/blob/develop/deployment/docker/server/Dockerfile#L100)

## integrations notes

- You don't need matchers for aliased integrations anymore.
- Only integrations with use project-level alias require matcher.

See this [issue][2]

[1]: https://ansible-semaphore.com/
[2]: https://github.com/semaphoreui/semaphore/issues/2752
