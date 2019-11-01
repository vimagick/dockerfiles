jira
====

[Jira][1] Software is a powerful platform that combines issue collection and agile
project management capabilities into a single application. Using Jira Software
helps you plan and organize tasks, workflows, and reports for your agile team
more efficiently.

```bash
$ mkdir -p data/jira
$ chown 1000:1000 data/jira
$ docker-compose up -d
$ docker-compose exec postgres psql -U jira
>>> select * from propertystring where id in (select id from propertyentry where PROPERTY_KEY='jira.sid.key');
  id   |    propertyvalue
-------+---------------------
 10101 | BP8Q-WXN6-SKX3-NB5M
>>> \q
$ curl http://localhost:8080/
```

[1]: https://support.atlassian.com/jirasoftware/
