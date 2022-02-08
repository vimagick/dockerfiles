jupyter
=======

Minimal Jupyter Notebook Stack

## docker-compose.yml

[how to select an image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html)

```yaml
version: "3.8"
services:
  notebook:
    image: jupyter/minimal-notebook
    ports:
      - "8888:8888"
    volumes:
      - ./data:/home/jovyan
    restart: unless-stopped
```

## up and running

```bash
$ cd ~/fig/jupyter/
$ mkdir -p data/.jupyter
$ chown -R 1000:100 data
$ docker-compose up -d
$ curl http://127.0.0.1:8888
```

## reset password

```bash
$ docker-compose exec notebook bash
>>> jupyter notebook password
Enter password: ******
Verify password: ******
[NotebookPasswordApp] Wrote hashed password to /home/jovyan/.jupyter/jupyter_notebook_config.json
$ docker-compose restart
```

## without password

File: ./data/.jupyter/jupyter_notebook_config.json

```json
{
  "NotebookApp": {
    "token": "",
    "password": "",
    "disable_check_xsrf": true
  }
}
```

## kill idle kernels (1 week ago)

```bash
curl -s "http://127.0.0.1:8888/api/kernels" |
  jq -r '.[]|select(now - (.last_activity|sub("\\..*Z";"Z")|fromdateiso8601) > 3600*24*7 and .connections==0).id' |
    while read kid; do curl -s -w '\n' -X DELETE "http://127.0.0.1:8888/api/kernels/$kid"; done
```

## nginx config

- <https://hands-on.cloud/how-to-setup-jupyter-behind-nginx-proxy/>
