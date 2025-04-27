motion-arm
==========

![](http://www.lavrsen.dk/foswiki/pub/Motion/WebPreferences/motion-trans.gif)

[Motion][1] is a program that monitors the video signal from one or more cameras
and is able to detect if a significant part of the picture has changed. Or in
other words, it can detect motion.

## docker-compose.yml

```yaml
version: "3.8"
services:
  motion:
    image: easypi/motion-arm64
    ports:
      - "8080:8080"
      - "8081:8081"
    volumes:
      - ./data/etc/motion.conf:/etc/motion/motion.conf
      - ./data/var:/var/lib/motion
      - /etc/localtime:/etc/localtime
    devices:
      - /dev/video0:/dev/video0
    restart: unless-stopped
```

You can edit `motion.conf` to customize motion.

```ini
# set image width
width 640

# set image height
height 480

# set frame rate
framerate 15

# disable image output
output_pictures off

# disable video output
ffmpeg_output_movies off

# encode timelapse movie
timelapse_interval 60
timelapse_mode daily
timelapse_fps 30
timelapse_codec mpg
timelapse_filename %Y%m%d-timelapse
```

Motion can work with Home-Assistant via [External Commands][2].

```yaml
binary_sensor:
  - platform: mqtt
    name: Motion
    state_topic: /pi/sensor/motion
    qos: 0
    payload_on: ON
    payload_off: OFF
    device_class: motion
```

```bash
# Command to be executed when a movie file (.mpg|.avi) is created. (default: none)
# To give the filename as an argument to a command append it with %f

# CURL
;on_movie_start curl -s -H 'X-HA-Access: ******' -H 'Content-Type: application/json' -d '{"state": "on", "attributes": {"friendly_name": "Motion", "device_class": "motion"}}' http://hass.easypi.pro:8123/api/states/binary_sensor.motion
# MQTT
;on_movie_start mosquitto_pub -h mqtt.easypi.pro -u username -P password -r -t /pi/sensor/motion -m ON

# Command to be executed when a movie file (.mpg|.avi) is closed. (default: none)
# To give the filename as an argument to a command append it with %f

# CURL
;on_movie_end curl -s -H 'X-HA-Access: ******' -H 'Content-Type: application/json' -d '{"state": "off", "attributes": {"friendly_name": "Motion", "device_class": "motion"}}' http://hass.easypi.pro:8123/api/states/binary_sensor.motion
# MQTT
;on_movie_end mosquitto_pub -h mqtt.easypi.pro -u username -P password -r -t /pi/sensor/motion -m OFF
```

Please read [this][3] to enable raspberry pi camera module.

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
[2]: http://www.lavrsen.dk/foswiki/bin/view/Motion/ExternalCommands
[3]: https://wiki.archlinux.org/index.php/Raspberry_Pi#Raspberry_Pi_camera_module
