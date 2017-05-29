oled
====

## Setup

```
OLED Pin | Name | Remarks | RPi Pin |  RPi Function
---------+------+---------+---------+--------------
1        | GND  | Ground  | P01-6   |  GND
2        | VCC  | +3.3V   | P01-1   |  3V3
3        | SCL  | Clock   | P01-5   |  GPIO 3 (SCL)
4        | SDA  | Data    | P01-3   |  GPIO 2 (SDA)
```

```bash
# hello world
$ docker-compose run --rm oled < demo.py
```

```
# list all examples
$ docker-compose run --rm --entrypoint ls oled

# clock
$ docker-compose run --rm oled clock.py

# pi logo
$ docker-compose run --rm oled pi_logo.py

# game of life
$ docker-compose run --rm game_of_life.py
```

## Todo

- [ ] Implement RESTful api as default CMD.
