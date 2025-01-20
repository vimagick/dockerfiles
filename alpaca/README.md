alpaca
======

[Alpaca][1] is a local HTTP proxy for command-line tools. It supports proxy auto-configuration (PAC) files and NTLM authentication.

Sample proxy.pac

```javascript
function FindProxyForURL(url, host) {
  return "DIRECT";
}
```

Read [this][2] to create your own.

[1]: https://github.com/samuong/alpaca
[2]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file
