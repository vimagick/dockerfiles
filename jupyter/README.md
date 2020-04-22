jupyter
=======

Minimal Jupyter Notebook Stack

## docker-compose.yml

```yaml
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
    "password": ""
  }
}
```

## nginx config

- <https://hands-on.cloud/how-to-setup-jupyter-behind-nginx-proxy/>
