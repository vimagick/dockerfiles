demucs
======

[Demucs][1] is based on U-Net convolutional architecture inspired by Wave-U-Net
and SING, with GLUs, a BiLSTM between the encoder and decoder, specific
initialization of weights and transposed convolutions in the decoder.

## up and running

```bash
$ docker-compose run --rm demucs input/test.mp3
```

## comparison

https://ai.honu.io/papers/demucs/

[1]: https://github.com/facebookresearch/demucs
