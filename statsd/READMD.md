statsd
======

[StatsD][1] is a network daemon that runs on the Node.js platform and listens for
statistics, like counters and timers, sent over UDP or TCP and sends aggregates
to one or more pluggable backend services (e.g., [Graphite][2]).

## docker-compose.yml

```yaml
statsd:
  image: vimagick/statsd
  ports:
    - "8125:8125/udp"
    - "8126:8126/tcp"
  links:
    - graphite
  restart: always

graphite:
  image: vimagick/graphite
  ports:
    - "2003:2003"
    - "2004:2004"
    - "7002:7002"
    - "8080:8080"
    - "9001:9001"
  volumes:
    - ./data:/opt/graphite/storage
  restart: always
```

## python client

```bash
$ pip install statsd
```

```python
import statsd
c = statsd.StatsClient('localhost', 8125)
c.incr('foo')  # Increment the 'foo' counter.
c.timing('stats.timed', 320)  # Record a 320ms 'stats.timed'.
```

[1]: https://github.com/etsy/statsd
[2]: http://graphite.readthedocs.org/
[3]: http://statsd.readthedocs.io/
