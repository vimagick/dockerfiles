jmxtrans
========

[jmxtrans][1] is very powerful tool which uses easily generated JSON (or YAML) based
configuration files and then outputs the data in whatever format you desire. It
does this with a very efficient engine design that will scale to communicating
with thousands of machines from a single jmxtrans instance.

## Using yaml2jmxtrans configuration converter (only support graphite)

```bash
$ wget https://github.com/jmxtrans/jmxtrans/raw/master/jmxtrans/tools/yaml2jmxtrans.py
$ chmod +x yaml2jmxtrans.py
$ ./yaml2jmxtrans.py config.yaml
```

[1]: https://github.com/jmxtrans/jmxtrans
