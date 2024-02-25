tldextract
==========

[tldextract][1] accurately separates a URL's subdomain, domain, and public
suffix, using the Public Suffix List (PSL).

## Tutorial

```bash
# Create an alias
$ alias tldextract='docker run --rm -u $(id -u):$(id -g) vimagick/tldextract'

# Run it
$ tldextract -j www.google.com
```

[1]: https://github.com/john-kurkowski/tldextract
