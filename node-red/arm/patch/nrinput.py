#!/usr/bin/env python3

import os
import struct
import subprocess
import sys
import time

if sys.version_info < (3,0):
    print("Sorry - currently only configured to work with python 3.x")
    sys.exit(1)

if len(sys.argv) > 2:
    cmd = sys.argv[1].lower()
    pin = int(sys.argv[2])

    if cmd == "mouse":  # catch mice button events
        file = open( "/dev/input/mice", "rb" )
        oldbutt = 0

        def getMouseEvent():
          global oldbutt
          global pin
          buf = file.read(3)
          pin = pin & 0x07
          button = ord( chr(buf[0]) ) & pin # mask out just the required button(s)
          if button != oldbutt:  # only send if changed
              oldbutt = button
              print(button)

        while True:
            try:
                getMouseEvent()
            except:
                file.close()
                sys.exit(0)

    elif cmd == "kbd":  # catch keyboard button events
        try:
            while not os.path.isdir("/dev/input/by-path"):
                time.sleep(10)
            infile = subprocess.check_output("ls /dev/input/by-path/ | grep -m 1 'kbd'", shell=True).strip()
            infile_path = "/dev/input/by-path/" + infile.decode()
            EVENT_SIZE = struct.calcsize('llHHI')
            file = open(infile_path, "rb")
            event = file.read(EVENT_SIZE)

            while event:
                (tv_sec, tv_usec, type, code, value) = struct.unpack('llHHI', event)
                #if type != 0 or code != 0 or value != 0:
                if type == 1:
                    # type,code,value
                    print("%u,%u" % (code, value))
                event = file.read(EVENT_SIZE)
            print("0,0")
            file.close()
            sys.exit(0)
        except:
            file.close()
            sys.exit(0)
else:
    print("Bad parameters - mouse|kbd {pin}")
