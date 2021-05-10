webdis
======

[Webdis][1] is a simple HTTP server which forwards commands to Redis and sends
the reply back using a format of your choice. Accessing
/COMMAND/arg0/arg1/.../argN[.ext] on Webdis executes the command on Redis and
returns the response; the reply format can be changed with the optional
extension (.json, .txt…)

[1]: https://webd.is/
