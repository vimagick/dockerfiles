motion-arm
==========

![](https://badge.imagelayers.io/vimagick/motion-arm:latest.svg)

[Motion][1] is a program that monitors the video signal from one or more cameras
and is able to detect if a significant part of the picture has changed. Or in
other words, it can detect motion.

## docker-compose.yml

```yaml
motion:
  image: easypi/motion-arm
  ports:
    - "8080:8080"
    - "8081:8081"
  volumes:
    - ./motion.conf:/etc/motion/motion.conf
    - ./data:/var/lib/motion
    - /etc/localtime:/etc/localtime
  devices:
    - /dev/video0:/dev/video0
  restart: always
```

You can edit `motion.conf` to customize motion.

```ini
# set image width
width 640

# set image height
height 480

# set frame rate
framerate 5

# disable image output
output_pictures off

# disable video output
ffmpeg_output_movies off

# encode timelapse movie
ffmpeg_timelapse 60
```

Please read [this][2] to enable raspberry pi camera module.

```
####################
# /boot/config.txt #
####################

##Camera
gpu_mem=128
start_file=start_x.elf
fixup_file=fixup_x.dat
disable_camera_led=1
```

[1]: http://lavrsen.dk/foswiki/bin/view/Motion/WebHome
[2]: https://wiki.archlinux.org/index.php/Raspberry_Pi#Raspberry_Pi_camera_module
