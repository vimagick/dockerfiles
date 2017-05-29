oled
====

## Demo

```
OLED Pin | Name | Remarks | RPi Pin |  RPi Function
---------+------+---------+---------+--------------
1        | GND  | Ground  | P01-6   |  GND
2        | VCC  | +3.3V   | P01-1   |  3V3
3        | SCL  | Clock   | P01-5   |  GPIO 3 (SCL)
4        | SDA  | Data    | P01-3   |  GPIO 2 (SDA)
```

```bash
# Show "hello world" on oled display module
$ cat demo.py | docker-compose run --rm oled
```

## Todo

- [ ] Implement RESTful API
