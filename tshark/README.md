tshark
======

[TShark][1] is a terminal-based network protocol analyzer used to capture and inspect packet data from a live network or a saved file.

```bash
$ alias tshark='docker run --rm -it --net=host --cap-add=NET_RAW --cap-add=NET_ADMIN -v $PWD/data -w /data easypi/tshark'
# Extract HTTP URLs live
$ tshark -i eth0 -Y "http.request" -T fields -e ip.src -e http.request.method -e http.host -e http.request.uri
# Extract HTTPS domains (TLS SNI)
$ tshark -i eth0 -Y "tls.handshake.type == 1" -T fields -e ip.src -e tls.handshake.extensions_server_name
# Combined HTTP + HTTPS sniffer
$ tshark -i eth0 -Y "http.request or tls.handshake.type==1" -T fields -e ip.src -e http.request.method -e http.host -e http.request.uri -e tls.handshake.extensions_server_name
```

[1]: https://www.wireshark.org/docs/man-pages/tshark.html