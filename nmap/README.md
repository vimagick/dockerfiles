nmap
====

[Nmap][1] ("Network Mapper") is a free and open source utility for network discovery and security auditing.

## Tutorial

```bash
$ alias nmap='docker run --rm -v $PWD:/data -w /data --network host easypi/nmap'

$ nmap -sT -Pn -p 22,80,443,8080 192.168.1.1

$ cat usernames.lst
root
admin

$ cat passwords.lst
123456
admin
password
abcdef
abc123

# DONE: https://nmap.org/nsedoc/scripts/ssh-brute.html
$ nmap --script ssh-brute --script-args "userdb=usernames.lst,passdb=passwords.lst,ssh-brute.timeout=4s,brute.firstonly=true" -p 22 192.168.1.1

# TODO:
$ cat /usr/share/nmap/scripts/http-form-brute.nse
...
local known_apps = {
  openwrt = {
    match = {
      class = "cbi-map",
    },
    uservar = "luci_username",
    passvar = "luci_password",
    onsuccess = "sysauth_http=",
  },
...
  if not (response and response.body and (response.status == 200 or response.status == 403)) then
    return nil, string.format("Unable to retrieve a login form from path %q", path)
  end
...

# TODO: https://nmap.org/nsedoc/scripts/http-form-brute.html
$ nmap --script http-form-brute --script-args "http-form-brute.method=POST,http-form-brute.path=/cgi-bin/luci/,http-form-brute.uservar=luci_username,http-form-brute.passvar=luci_password,userdb=usernames.lst,passdb=passwords.lst,http-form-brute.onfailure=Forbidden,http-form-brute.sessioncookies=false,brute.firstonly=true" -p 80 192.168.1.1 -d
```

[1]: https://nmap.org/
