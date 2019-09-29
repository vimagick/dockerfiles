ambari
======

The [Apache Ambari][1] project is aimed at making Hadoop management simpler by
developing software for provisioning, managing, and monitoring Apache Hadoop
clusters. Ambari provides an intuitive, easy-to-use Hadoop management web UI
backed by its RESTful APIs.

## docker-compose.yml

```yaml
ambari:
  image: vimagick/ambari
  hostname: ambari-server
  ports:
    - "8080:8080"
  volumes:
    - ./data/ambari:/etc/ambari-server/conf
  links:
    - postgres
  extra_hosts:
    - ambari-agent1:172.16.1.101
    - ambari-agent2:172.16.1.102
    - ambari-agent3:172.16.1.103
  restart: unless-stopped

postgres:
  image: postgres:alpine
  volumes:
    - /data/postgres:/var/lib/postgresql/data
  environment:
    - POSTGRES_USER=ambari
    - POSTGRES_PASSWORD=ambari
    - POSTGRES_DB=ambari
  restart: unless-stopped
```

> Make sure that ambari-server is reachable by ambari-agents.

## Up and Running

```bash
$ docker-compose up -d
$ docker-compose exec ambari bash
>>> ambari-server setup
>>> PGUSER=ambari PGPASSWORD=ambari psql -h postgres -d ambari -f /var/lib/ambari-server/resources/Ambari-DDL-Postgres-CREATE.sql
>>> ambari-server start
$ curl localhost:8080
```

[1]: https://ambari.apache.org/
