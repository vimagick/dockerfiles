ghost
=====

[Ghost][1] is a free and open source blogging platform written in JavaScript.

## docker-compose.yml

```yaml
ghost:
  image: ghost:alpine
  ports:
    - "127.0.0.1:2368:2368"
  volumes:
    - ./data:/var/lib/ghost/content
  restart: always
```

## Up and Running

```bash
$ docker-compose up -d
$ cd data
$ sed -i 's@http://localhost:2368@https://blog.easypi.info@' config.js
$ grep -rIl 'googleapis' core content | xargs sed -i 's/googleapis/useso/g'
$ docker-compose restart
```

> :warning: `useso.com` doesn't support https!

## Setup SSL

> Read [this][2] to setup SSL.

```
server {
    listen 80 default;
    server_name _;
    location / {
        return 301 https://$host$request_uri;
    }
}

server {
    listen 443 ssl;
    server_name easypi.info blog.easypi.info;
    ssl_certificate ssl/easypi.info.crt;
    ssl_certificate_key ssl/easypi.info.key;
    location / {
        if ($host = 'easypi.info') {
            return 301 $scheme://blog.$host$request_uri;
        }
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://127.0.0.1:2368;
    }
}
```

## Ghost Setup

[Ghost][3] allows you to inject code into the top and bottom of your theme
files without editing them.

```css
<style>
  pre code, pre tt {
    white-space: pre !important;
  }
</style>
```

[1]: https://ghost.org/
[2]: http://support.ghost.org/setup-ssl-self-hosted-ghost/
[3]: https://blog.easypi.info/ghost/settings/code-injection/
