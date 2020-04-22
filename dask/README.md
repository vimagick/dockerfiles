dask
====

[Dask][1] is a flexible library for parallel computing in Python.

## up and running

```bash
$ mkdir -p data/{jupyter,work}
$ chown -R 1000:100 data
$ docker-compose up -d
$ docker-compose logs -f notebook
$ curl http://127.0.0.1:8888
```

## make it public

```bash
$ docker exec -it xxxxxx bash
>>> jupyter notebook password
Enter password:  ****
Verify password: ****
[NotebookPasswordApp] Wrote hashed password to ~/.jupyter/jupyter_notebook_config.json

$ docker service update --force dask_notebook
```

- <https://jupyter-notebook.readthedocs.io/en/stable/public_server.html>

[1]: https://docs.dask.org/en/latest/
