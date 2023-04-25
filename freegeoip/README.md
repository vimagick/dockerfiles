freegeoip
=========

[freegeoip][1] provides a public HTTP API for software developers to search the geolocation of IP addresses.

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

$ curl -s http://localhost:8888/metrics
freegeoip_client_connections{proto="http"} 0
freegeoip_client_country_code_total{country_code="unknown"} 7
freegeoip_client_ipproto_version_total{ip="4"} 7
freegeoip_db_events_total{event="loaded"} 1
go_gc_duration_seconds{quantile="0"} 5.9754e-05
go_gc_duration_seconds{quantile="0.25"} 7.0367e-05
go_gc_duration_seconds{quantile="0.5"} 9.6169e-05
go_gc_duration_seconds{quantile="0.75"} 0.000112867
go_gc_duration_seconds{quantile="1"} 0.000260533
go_gc_duration_seconds_sum 0.001055739
```

[1]: https://freegeoip.io/
