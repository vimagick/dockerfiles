nmap
====

[Nmap][1] ("Network Mapper") is a free and open source utility for network discovery and security auditing.

## Tutorial

```bash
$ alias nmap='docker run -t --rm -v $PWD:/data -w /data --network host easypi/nmap'

$ nmap -sT -Pn -p 22,80,443,8080 192.168.1.1

$ cat hostnames.lst
git
gitlab
jenkins
mqtt
n8n
nodered
node-red

# https://nmap.org/nsedoc/scripts/dns-brute.html
$ nmap --script dns-brute --script-args dns-brute.domain=duckdns.org,dns-brute.hostlist=hostnames.lst,newtargets -p 80,443 --open

$ cat usernames.lst
root
admin

$ cat passwords.lst
123456
admin
password
abcdef
abc123

# https://nmap.org/nsedoc/scripts/ssh-brute.html
$ nmap --script ssh-brute --script-args "userdb=usernames.lst,passdb=passwords.lst,ssh-brute.timeout=4s,brute.firstonly=true" -p 22 192.168.1.1

# https://nmap.org/nsedoc/scripts/http-form-brute.html
$ cat /usr/share/nmap/scripts/http-form-brute.nse
...
local known_apps = {
  openwrt = {
    match = {},
    uservar = "luci_username",
    passvar = "luci_password",
    onsuccess = "sysauth_http",
  },
...
  if not (response and response.body and (response.status == 200 or response.status == 403)) then
    return nil, string.format("Unable to retrieve a login form from path %q", path)
  end
...

# Long version (without known_apps patch)
$ nmap --script http-form-brute --script-args "http.useragent=Mozilla/5.0,http-form-brute.method=POST,http-form-brute.path=/cgi-bin/luci/,http-form-brute.uservar=luci_username,http-form-brute.passvar=luci_password,userdb=usernames.lst,passdb=passwords.lst,http-form-brute.onsuccess=sysauth_http,brute.firstonly=true" -p 80 192.168.1.1 -d
PORT   STATE SERVICE REASON
80/tcp open  http    syn-ack ttl 64
| http-form-brute:
|   Accounts:
|     root:123456 - Valid credentials
|_  Statistics: Performed 5 guesses in 1 seconds, average tps: 5.0

# Short version (with known_apps patch)
$ nmap --script http-form-brute --script-args "http.useragent=Mozilla/5.0,http-form-brute.path=/cgi-bin/luci/,userdb=usernames.lst,passdb=passwords.lst,brute.firstonly=true" -p 80 192.168.1.1 -d
```

> [!Tip]
> - Use `--script /path/to/script.nse` to run your own modified script
> - Use `--script +script` to run against non-standard http port (e.g., :3389, :5901)
> - Debug lua script: `stdnse.debug1("%s", json.generate(form))`

[1]: https://nmap.org/
