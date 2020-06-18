datax
=====

[DataX][1] is a data migration tool written by alibaba.

## up and running

```bash
$ alias datax='docker run --rm -v $PWD:/data -w /data vimagick/datax'
$ wget https://github.com/alibaba/DataX/raw/master/core/src/main/job/job.json
$ vi job.json
$ datax job.json
```

## example result

```
DataX (DATAX-OPENSOURCE-3.0), From Alibaba !
Copyright (C) 2010-2017, Alibaba Group. All Rights Reserved.
DataX   19890604        1989-06-04 08:00:00     true    test
DataX   19890604        1989-06-04 08:00:00     true    test
DataX   19890604        1989-06-04 08:00:00     true    test
DataX   19890604        1989-06-04 08:00:00     true    test
DataX   19890604        1989-06-04 08:00:00     true    test
任务启动时刻                    : 2020-06-18 08:39:38
任务结束时刻                    : 2020-06-18 08:39:48
任务总计耗时                    :                 10s
任务平均流量                    :               26B/s
记录写入速度                    :              1rec/s
读出记录总数                    :                  10
读写失败总数                    :                   0
```

[1]: https://github.com/alibaba/DataX
