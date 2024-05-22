ntfy
====

[ntfy][1] (pronounced "_notify_") is a simple HTTP-based pub-sub notification service.
With ntfy, you can **send notifications to your phone or desktop via scripts** from
any computer, **without having to sign up or pay any fees**.

```bash
$ mkdir -p data/{etc,log,var}
$ docker compose up -d
$ docker compose exec nify sh
>>> ntfy user add pi
>>> ntfy user add --role=admin kev
>>> ntfy user list
>>> ntfy access pi test rw
>>> ntfy access '*' test ro
>>> ntfy access
>>> ntfy token add --expires=1w --label=pi5 pi
>>> ntfy token add --expires=1y --label=iphone kev
>>> ntfy token list
>>> exit
```

[1]: https://docs.ntfy.sh/config/
