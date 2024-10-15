jinjanator
==========

[jinjanator][1] is a CLI tool to render Jinja2 templates.

```bash
$ alias jinjanate='docker run --rm -i -v $PWD:/tmp -w /tmp vimagick/jinjanator --quiet'
$ echo '<data><name>{{ name }}</name><age>{{ age }}</age></data>' > person.xml.j2
$ echo '{"name":"Andrew", "age":31}' > person.json
$ jinjanate person.xml.j2 person.json
<data><name>Andrew</name><age>31</age></data>
```

[1]: https://github.com/kpfleming/jinjanator
