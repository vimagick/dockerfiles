spleeter
========

[Spleeter][1] is Deezer source separation library with pretrained models
written in Python and uses Tensorflow.

```bash
$ wget https://github.com/deezer/spleeter/raw/master/audio_example.mp3
$ alias spleeter='docker run --rm -v $PWD:/data -w /data deezer/spleeter:3.8-2stems'
$ spleeter separate -p spleeter:2stems -o output audio_example.mp3
$ tree output
└── audio_example
    ├── accompaniment.wav
    └── vocals.wav
```

[1]: https://github.com/deezer/spleeter
