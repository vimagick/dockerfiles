semaphore
=========

Ansible [Semaphore][1] is beautiful web interface for running Ansible playbooks. You do not need to change your playbooks to start using it.

## Up and Running

```bash
$ mkdir -m 777 data/{etc/secrets,var,tmp}
$ docker compose up -d
$ http :3000/api/ping
```

> [!Note]
> Docker Container [USER=1001](https://github.com/semaphoreui/semaphore/blob/develop/deployment/docker/server/Dockerfile#L100)

> [!Note]
> Load secrets from [files](https://semaphoreui.com/docs/user-guide/key-store/env-and-file-sources#allow-the-directory)

## CI/CD Integration

```bash
$ curl -X POST http://localhost:3000/api/project/1/tasks \
       -H 'Authorization: Bearer YOUR_API_TOKEN' \
       --json '{"template_id": 5, "message": "Triggered by CI"}'
$ curl -X GET http://localhost:3000/api/project/1/tasks/{task_id} \
       -H 'Authorization: Bearer YOUR_API_TOKEN'
```

## Integrations Notes

- You don't need matchers for aliased integrations anymore.
- Only integrations with use project-level alias require matcher.

See this [issue][2]

[1]: https://semaphoreui.com/docs/
[2]: https://github.com/semaphoreui/semaphore/issues/2752
