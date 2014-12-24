#!/usr/bin/env phantomjs

var system = require('system');
var server = require('webserver').create();
var parser = require('./parser');
var client = require('./client');
var utils = require('./utils');


var port;
if(system.args.length > 1) {
    port = parseInt(system.args[1]);
} else {
    port = 1024;
}


var ok = server.listen(port, function(request, response) {
    var req;
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
    } else {
        send(response, 405);
    }
});


if(ok) {
    utils.info('service started (listen %d)', port);
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

