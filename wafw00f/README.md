wafw00f
=======

[WAFW00F][1] allows one to identify and fingerprint Web Application Firewall
(WAF) products protecting a website.

```bash
$ alias wafw00f='docker run --rm -it vimagick/wafw00f'

$ wafw00f https://www.baidu.com
[*] Checking https://www.baidu.com
[+] Generic Detection results:
[*] The site https://www.baidu.com seems to be behind a WAF or some sort of security solution
[~] Reason: The server header is different when an attack is detected.
The server header for a normal response is "BWS/1.1", while the server header a response to an attack is "Apache",
[~] Number of requests: 7
```

[1]: https://github.com/EnableSecurity/wafw00f
