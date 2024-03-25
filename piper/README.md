piper
=====

[piper][1] is a fast, local neural text to speech system that sounds great and is optimized for the Raspberry Pi 4.

```bash
# Create an alias
$ alias piper='docker run -i --rm -u $(id -u):$(id -g) -v $PWD:/tmp vimagick/piper'

# Do text-to-speech
$ echo 'Welcome to the world of speech synthesis!' | piper -f /tmp/welcome.wav

# Play audio
$ play welcome.wav
```

List of voices: https://rhasspy.github.io/piper-samples/

[1]: https://github.com/rhasspy/piper
