visidata
========

[VisiData][1] is a terminal interface for exploring and arranging tabular data.
VisiData supports tsv, csv, sqlite, json, xlsx (Excel), hdf5, and many other formats.

## Tutorial

```bash
# Create an alias
$ alias vd='docker run --rm -it -u $(id -u):$(id -g) -v "$PWD:/data" -w /data vimagick/visidata'
$ alias visidata='docker run --rm -it -u $(id -u):$(id -g) -v "$PWD:/data" -w /data vimagick/visidata'

# Create a csv file
$ echo -e 'a,b\n1,2\n3,4' > input.csv

# View the csv file
$ vd input.csv
```

[1]: https://github.com/saulpw/visidata
