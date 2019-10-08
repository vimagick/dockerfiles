ambari
======

The [Apache Ambari][1] project is aimed at making Hadoop management simpler by
developing software for provisioning, managing, and monitoring Apache Hadoop
clusters. [Ambari][2] provides an intuitive, easy-to-use Hadoop management web UI
backed by its RESTful APIs.

![](https://docs.cloudera.com/common/img/product_icons/icon-ambari.png)

Make sure that ambari-server is reachable by ambari-agents via DNS.

## Up and Running

```bash
$ docker-compose run --rm server bash
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

$ docker-compose up -d
Starting ambari_postgres_1 ... done
Starting ambari_server_1 ... done

$ curl http://localhost:8080/
```

[1]: https://ambari.apache.org/
[2]: https://docs.cloudera.com/HDPDocuments/Ambari/Ambari-2.7.4.0/index.html
