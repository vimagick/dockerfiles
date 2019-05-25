ntopng
======

[ntopng][1] is the next generation version of the original ntop, a network traffic
probe that monitors network usage. ntopng is based on libpcap and it has been
written in a portable way in order to virtually run on every Unix platform,
MacOSX and on Windows as well.

[nProbe][2] is a software NetFlow v5/v9/IPFIX probe able to collect, analyze and
export network traffic reports using the standard Cisco NetFlow v5/v9/IPFIX
format. It is available for most of the OSs on the market (Windows, BSD, Linux,
MacOSX). When installed on a PC, nProbe turn it into a Network-aware monitoring
appliance.

## Server (collector mode)

```
$ mkdir -m 777 -p data/{ntopng,redis}
$ docker-compose up -d
$ curl http://localhost:3000
```

## Client (probe mode)

```
$ nprobe -i eth0 -n none --zmq-probe-mode --zmq tcp://ntopng-server:5556 -f 'tcp port 80'
```



[1]: https://www.ntop.org/guides/ntopng/cli_options.html
[2]: https://www.ntop.org/guides/nProbe/cli_options.html
