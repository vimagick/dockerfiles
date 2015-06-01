scrapyd-onbuild
===============

Dockerfile for building an image that runs [scrapyd][1].  

Please use this image as base for your own project.

You may edit these files:

- `packages.txt` - additional packages to be installed (via `apt-get install`)
- `dependencies.txt` - dependencies for python requirements (via `apt-get install/purge`)
- `requirements.txt` - additional python packages to be installed (via `pip install`)

[1]: https://github.com/scrapy/scrapyd
