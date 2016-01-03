motion-arm
==========

![](https://badge.imagelayers.io/vimagick/motion-arm:latest.svg)

[Motion][1] is a program that monitors the video signal from one or more cameras
and is able to detect if a significant part of the picture has changed. Or in
other words, it can detect motion.

## docker-compose.yml

```
motion:
  image: vimagick/motion-arm
  ports:
    - "8080:8080"
    - "8081:8081"
  volumes:
#   - ./motion.conf:/etc/motion/motion.conf
    - ./motion:/var/lib/motion
  devices:
    - /dev/video0:/dev/video0
  restart: always
```

You can edit `/etc/motion/motion.conf` to customize motion.

```
# set image width
width 800

# set image height
height 600

# set frame rate
framerate 5

# disable image output
output_pictures off

# disable video output
ffmpeg_output_movies off

# encode timelapse movie
ffmpeg_timelapse 60
```

[1]: http://lavrsen.dk/foswiki/bin/view/Motion/WebHome
