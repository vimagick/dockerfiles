nginx-sso
=========

[nginx-sso][1] is intended to be used within the `ngx_http_auth_request_module` of
Nginx to provide a single-sign-on for a domain using one central authentication
directory.

```bash
# start service
$ docker-compose up -d

# view log
$ docker-compose logs --tail 10 -f

# reload config
$ docker-compose kill -s SIGHUP
```

[1]: https://github.com/Luzifer/nginx-sso/wiki
