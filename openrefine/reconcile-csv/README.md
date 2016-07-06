reconcile-csv
=============

[Reconcile-csv][1] is a reconciliation service for [OpenRefine][2] running from a
CSV file. It uses fuzzy matching to match entries in one dataset to entries in
another dataset, helping to introduce unique IDs into the system - so they can
be used to join your data painlessly.

## docker-compose.yml

```yaml
reconcile-csv:
  image: vimagick/openrefine-reconcile-csv
  ports:
    - "8000:8000"
  volumes:
    - ./data:/data
  environment:
    - JAVA_OPTS=-Xmx2g
    - CSV_FILE=input.csv
    - SEARCH_COLUMN=name
    - ID_COLUMN=id
  restart: always
```

## input.csv

```csv
id,name
1,kevin
2,tom
3,sarah
4,mike
5,lucy
```

## up and running

```bash
$ docker-compose up -d
$ curl http://localhost:8000/reconcile?query=kev
$ curl http://localhost:8000/reconcile?query={%22query%22:%22kev%22,%22limit%22:1}
$ curl http://localhost:8000/view/1
```

[1]: http://okfnlabs.org/reconcile-csv/
[2]: https://github.com/OpenRefine/OpenRefine/wiki
