ghost
=====

[Ghost][1] is a free and open source blogging platform written in JavaScript.

## docker-compose.yml

```yaml
version: "3.8"

services:

  ghost:
    image: ghost:alpine
    ports:
      - "2368:2368"
    volumes:
      - ./data:/var/lib/ghost/content
    environment:
      - url=https://blog.easypi.duckdns.org
      - database__client=sqlite3
      - database__connection__filename=/var/lib/ghost/content/data/ghost.db
    restart: unless-stopped

  backup:
    image: offen/docker-volume-backup
    environment:
      # AWS_BUCKET_NAME=backups
      # AWS_S3_PATH=ghost
      # AWS_ACCESS_KEY_ID=******
      # AWS_SECRET_ACCESS_KEY=******
      - BACKUP_FILENAME=backup-ghost-%Y-%m-%dT%H-%M-%S.tar.gz
      - BACKUP_PRUNING_PREFIX=backup-ghost-
      - BACKUP_LATEST_SYMLINK=backup-ghost-latest.tar.gz
      - BACKUP_RETENTION_DAYS=30
    volumes:
      - ./data:/backup/ghost:ro
      - ./backups:/archive
      - /var/run/docker.sock:/var/run/docker.sock:ro
    depends_on:
      - ghost
    restart: unless-stopped
```

## Up and Running

```bash
$ docker-compose up -d
$ curl https://blog.easypi.duckdns.org/ghost/
$ docker-compose exec backup backup
```

## Setup SSL

> Read [this][2] to setup SSL.

```nginx
server {
    listen 80 default;
    server_name _;
    location / {
        return 301 https://$host$request_uri;
    }
}

server {
    listen 443 ssl;
    server_name easypi.duckdns.org blog.easypi.duckdns.org;
    ssl_certificate ssl/easypi.duckdns.org/fullchain.pem;
    ssl_certificate_key ssl/easypi.duckdns.org/privkey.pem;
    location / {
        if ($host = 'easypi.duckdns.org') {
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
[3]: https://blog.easypi.duckdns.org/ghost/settings/code-injection/
