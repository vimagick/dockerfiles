apm-server
==========

The [APM Server][1] receives data from [APM agents][2] and transforms them into
Elasticsearch documents. It does this by exposing an HTTP server endpoint to
which agents stream the APM data they collect. After the APM Server has
validated and processed events from the APM agents, the server transforms the
data into Elasticsearch documents and stores them in corresponding
Elasticsearch indices.

The APM Server works in conjunction with APM agents, Elasticsearch, and Kibana.
Please view the APM Overview for details on how these components work together.

[1]: https://www.elastic.co/guide/en/apm/server/current/index.html
[2]: https://www.elastic.co/guide/en/apm/agent/index.html
