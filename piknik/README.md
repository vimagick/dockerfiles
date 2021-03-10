piknik
======

Copy/paste anything over the network.

## docker-compose.yml

```yaml
piknik:
  image: vimagick/piknik
  ports:
    - "8075:8075"
  volumes:
    - ./data:/etc/piknik
  restart: unless-stopped
```

## Server Setup

```bash
$ mkdir -p data
$ touch data/piknik.toml
$ docker-compose run --rm piknik -genkeys > data/piknik.toml
$ vim data/piknik.toml
$ docker-compose up -d
```

> `piknik.toml` contains server/client settings.

## Client Setup

```bash
# ~/.bashrc

# pkc : read the content to copy to the clipboard from STDIN
alias pkc='piknik -copy'

# pkp : paste the clipboard content
alias pkp='piknik -paste'

# pkm : move the clipboard content
alias pkm='piknik -move'

# pkz : delete the clipboard content
alias pkz='piknik -copy < /dev/null' 
```

```bash
$ vim ~/.piknik.toml

$ source ~/.bashrc

$ pkc
hello world  
^D

$ pkp
hello world

$ pkm
hello world

$ pkm
The clipboard might be empty 
```
