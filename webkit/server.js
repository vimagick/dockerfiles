#!/usr/bin/env phantomjs

var fs = require('fs');
var sys = require('system');
var server = require('webserver').create();
var parser = require('./parser');
var client = require('./client');
var utils = require('./utils');


var port;
if(sys.args.length > 1) {
    port = parseInt(sys.args[1]);
} else {
    port = 1024;
}


var ok = server.listen(port, function(request, response) {
    if(request.method === 'POST') {
        try {
            var raw = request.postRaw || request.post || '{}',
                req = parser.setDefaults(JSON.parse(raw));
            utils.info('recv: %s', req.targetUrl);
            var reqId = client.urlopen(req, function(err, res) {
                if(err) {
                    send(response, 500, res);
                } else {
                    send(response, 200, res);
                }
            });
            utils.info('proc: %s (%s)', reqId, req.targetUrl);
        } catch(ex) {
            send(response, 400, ex);
        }
    } else if (request.method === 'GET') {
        response.statusCode = 200;
        response.setHeader('X-Powered-By', 'PhantomJS')
        response.setHeader('Content-Type', 'text/plain')
        response.write('Powered by PhantomJS 2.0.0');
        response.close();
    } else{
        send(response, 405);
    }
});


if(ok) {
    var pidfile = '/var/run/webkit-' + port.toString() + '.pid';
    utils.info('service started (listen %d)', port);
    utils.info('write pidfile: %s (pid %d)', pidfile, sys.pid);
    fs.write(pidfile, sys.pid.toString(), 'w');
} else {
    utils.error('service failed to start');
    phantom.exit(1);
}


function send(response, code, data){
    if(code === 200) {
        utils.info('send: %s (%d)', data.request.requestId, code);
    } else {
        utils.warn('send: %s (%d)', data, code);
    }
    response.statusCode = code;
    response.setHeader('X-Powered-By', 'PhantomJS')
    response.setHeader('Content-Type', 'application/json')
    response.write(JSON.stringify(data || '{}'));
    response.close();
}

