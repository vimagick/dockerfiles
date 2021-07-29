audiowaveform
=============

![](https://badge.imagelayers.io/vimagick/audiowaveform:latest.svg)

**audiowaveform** is a C++ command-line application that generates waveform data
from either MP3, WAV, or FLAC format audio files. Waveform data can be used to
produce a visual rendering of the audio, similar in appearance to audio editing
applications.

### Run

    $ docker pull vimagick/audiowaveform
    $ alias awf='docker run --rm -v `pwd`:/data -w /data vimagick/audiowaveform'
    $ awf -i input.mp3 -o output.png

## Command line options

**audiowaveform** accepts the following command-line options:

| Short           | Long                           | Description                                                                                                   |
| --------------- | ------------------------------ | ------------------------------------------------------------------------------------------------------------- |
|                 | `--help`                       | Show help message                                                                                             |
| `-v`            | `--version`                    | Show version information                                                                                      |
| `-i <filename>` | `--input-filename <filename>`  | Input mono or stereo audio (.wav or .mp3) or waveform data (.dat) file name                                   |
| `-o <filename>` | `--output-filename <filename>` | Output waveform data (.dat or .json), audio (.wav), or PNG image (.png) file name                             |
| `-z <level>`    | `--zoom <zoom>`                | Zoom level (samples per pixel), default: 256. Not valid if `--end` or `--pixels-per-second` is also specified |
|                 | `--pixels-per-second <zoom>`   | Zoom level (pixels per second), default: 100. Not valid if `--end` or `--zoom` is also specified              |
| `-b <bits>`     | `--bits <bits>`                | Number of bits resolution when creating a waveform data file (either 8 or 16), default: 16                    |
| `-s <seconds>`  | `--start <seconds>`            | Start time (seconds), default: 0                                                                              |
| `-e <seconds>`  | `--end <seconds>`              | End time (seconds). Not valid if `--zoom` is also specified                                                   |
| `-w <width>`    | `--width <width>`              | Width of output image (pixels), default: 800                                                                  |
| `-h <height>`   | `--height <height>`            | Height of output image (pixels), default: 250                                                                 |
| `-c <scheme>`   | `--colors <scheme>`            | Color scheme of output image (either 'audition' or 'audacity'), default: audacity                             |
|                 | `--border-color <color>`       | Border color (in rrggbb\[aa\] hex format), default: set by `--colors` option                                  |
|                 | `--background-color <color>`   | Background color (in rrggbb\[aa\] hex format), default: set by `--colors` option                              |
|                 | `--waveform-color <color>`     | Waveform color (in rrggbb\[aa\] hex format), default: set by `--colors` option                                |
|                 | `--axis-label-color <color>`   | Axis label color (in rrggbb\[aa\] hex format), default: set by `--colors` option                              |
|                 | `--no-axis-labels`             | Render PNG images without axis labels                                                                         |
|                 | `--with-axis-labels`           | Render PNG images with axis labels (default)                                                                  |

