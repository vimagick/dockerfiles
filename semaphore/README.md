semaphore
=========

Ansible [Semaphore][1] is beautiful web interface for running Ansible playbooks. You
do not need to change your playbooks to start using it.

## up and running

```
$ mkdir -m 777 data
$ docker compose up -d
$ curl :3000/api/ping
```

## call api (FIXME)

```bash
$ http :3000/api/auth/login auth=admin password=**********

HTTP/1.1 204 No Content
Content-Type: application/json
Date: Mon, 27 Nov 2023 07:58:43 GMT
Set-Cookie: semaphore=******; Path=/

$ http POST :3000/api/user/tokens 'Cookie: semaphore=******'

{
    "created": "0001-01-01T00:00:00Z",
    "expired": false,
    "id": "***",
    "user_id": 1
}

$ http :3000/api/project/1 'Authorization: Bearer ***'
HTTP/1.1 401 Unauthorized
Content-Length: 0
Content-Type: application/json
Date: Mon, 27 Nov 2023 08:27:14 GMT
```

[1]: https://ansible-semaphore.com/
