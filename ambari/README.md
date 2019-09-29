ambari
======

The [Apache Ambari][1] project is aimed at making Hadoop management simpler by
developing software for provisioning, managing, and monitoring Apache Hadoop
clusters. Ambari provides an intuitive, easy-to-use Hadoop management web UI
backed by its RESTful APIs.

Make sure that ambari-server is reachable by ambari-agents.

## Up and Running

```bash
$ docker-compose up -d

$ docker-compose exec ambari bash
>>> ambari-server setup
Customize user account for ambari-server daemon [y/n] (n)?
Do you want to change Oracle JDK [y/n] (n)?
Enter advanced database configuration [y/n] (n)? y
Enter choice (4):
Hostname (postgres):
Port (5432):
Database name (ambari):
Postgres schema (public):
Username (ambari):
Enter Database Password (ambari):
Proceed with configuring remote database connection properties [y/n] (y)?
>>> PGUSER=ambari PGPASSWORD=ambari psql -h postgres -d ambari -f /var/lib/ambari-server/resources/Ambari-DDL-Postgres-CREATE.sql
CREATE TABLE ...
CREATE INDEX ...

$ docker-compose exec ambari ambari-server start
Waiting for server start........................
Server started listening on 8080
Ambari Server 'start' completed successfully.

$ curl http://localhost:8080/
```

[1]: https://ambari.apache.org/
