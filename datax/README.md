datax
=====

[DataX][1] is a data migration tool written by alibaba.

## up and running

```bash
$ alias datax='docker run --rm -v $PWD:/data vimagick/datax'
$ wget https://github.com/alibaba/DataX/raw/master/core/src/main/job/job.json
$ datax job.json
```

[1]: https://github.com/alibaba/DataX
