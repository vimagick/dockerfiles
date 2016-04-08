clamav
======

![](https://badge.imagelayers.io/vimagick/clamav:latest.svg)

[ClamAV®][1] is an open source antivirus engine for detecting trojans, viruses,
malware & other malicious threats.

## Up and Running

```
# create a function
function av() {
   local DIR=${1:-$PWD}
   docker run --rm -v "$DIR:/data" --name clamav vimagick/clamav -i -r
}

# scan a directory
av ~/Downloads

# ----------- SCAN SUMMARY -----------
# Known viruses: 4297635
# Engine version: 0.99
# Scanned directories: 1
# Scanned files: 3
# Infected files: 0
# Data scanned: 0.02 MB
# Data read: 0.01 MB (ratio 2.00:1)
# Time: 11.623 sec (0 m 11 s)
```

[1]: http://www.clamav.net/
