barcode-server
==============

[barcode-server][1] is a simple daemon to read barcodes from USB Barcode
Scanners and expose them to other service using HTTP calls, a websocket API or
MQTT.

```bash
$ mkdir -p data
$ wget -P data https://github.com/markusressel/barcode-server/raw/master/barcode_server.yaml
$ vim data/barcode_server.yaml
$ docker compose up -d
```

[1]: https://github.com/markusressel/barcode-server
