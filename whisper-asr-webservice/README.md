whisper-asr-webservice
======================

[Whisper ASR Webservice][1] is a free transcription service powered by Whisper AI.

It supports following whisper models:

- [openai/whisper](https://github.com/openai/whisper)
- [SYSTRAN/faster-whisper](https://github.com/SYSTRAN/faster-whisper)

## Server

```bash
$ docker compose up -d
$ curl http://127.0.0.1:9000/docs
```

## Client

```bash
$ wget -O audio.wav https://github.com/rhasspy/piper/raw/master/notebooks/wav/en/success.wav
$ curl -F audio_file=@audio.wav "http://127.0.0.1:9000/asr?task=transcribe&output=srt"
$ curl -F audio_file=@audio.wav "http://127.0.0.1:9000/detect-language"
```

[1]: https://github.com/ahmetoner/whisper-asr-webservice
