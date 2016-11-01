elasticsearch
=============

WARNING: IT DOES NOT WORK ON RASPBERRY PI!

```
$ sudo vi /etc/dphys-swapfile
- CONF_SWAPSIZE=100
+ CONF_SWAPSIZE=2048

$ sudo systemctl restart dphys-swapfile.service

$ docker-compose up -d

$ docker-compose logs -f
elasticsearch_1  | Error occurred during initialization of VM
elasticsearch_1  | Could not reserve enough space for 2097152KB object heap
```
