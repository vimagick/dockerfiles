freegeoip
=========

## docker-compose.yml

```yaml
freegeoip:
  image: vimagick/freegeoip
  ports:
    - "8080:8080"
    - "8888:8888"
  restart: always
```

## up and running

```bash
$ docker-compose up -d

$ curl -s http://localhost:8080/json/8.8.8.8 | jq .
{
  "ip": "8.8.8.8",
  "country_code": "US",
  "country_name": "United States",
  "region_code": "",
  "region_name": "",
  "city": "",
  "zip_code": "",
  "time_zone": "",
  "latitude": 37.751,
  "longitude": -97.822,
  "metro_code": 0
}
```
