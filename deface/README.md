deface
======

[deface][1] is a simple command-line tool for automatic anonymization of faces in videos or photos.

## Tutorial

```bash
# create an alias
$ alias deface='docker run --rm -u $(id -u):$(id -g) -v $PWD:/data -w /data vimagick/deface'

# download a image
$ wget https://github.com/ORB-HD/deface/raw/master/examples/city.jpg

# process the image
$ deface city.jpg
Input:  city.jpg
Output: city_anonymized.jpg
```

[1]: https://github.com/ORB-HD/deface
