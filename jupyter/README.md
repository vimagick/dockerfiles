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
    - ./work:/home/jovyan/work
  restart: unless-stopped
```

## up and running

```
cd ~/fig/jupyter/
mkdir work
chown 1000:1000 work
docker-compose up -d
```
