ElastAlert
==========

http://elastalert.readthedocs.io/en/latest/

```bash
$ docker-compose up -d
$ docker-compose exec elastalert sh
>>> cd /opt/elastalert/rules
>>> elastalert-test-rule xxx.yaml
>>> exit
$ docker-compose restart
```
