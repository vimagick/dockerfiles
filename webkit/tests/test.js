#!/usr/bin/env phantomjs

var client = require('../client');
var parser = require('../parser');

var req = {
    targetUrl: 'http://www.baidu.com',
    requestType: 'script',
    loadImages: true,
    resourceUrlBlacklist: [],
    timeout: 60000,
    delayTime: 1000,
    injectedScripts: ['./input.js'],
    execScripts: {preInjected: ['new Date().getTime()', 'Math.sqrt(2)'], postInjected: ['1+2+3']},
}

var id = client.urlopen(parser.setDefaults(req), function(err, res) {
    if(err) {
        console.log('========== success =========');
    } else {
        console.log('========== fail =========');
    }
    console.log(JSON.stringify(res, undefined, 2));
});

console.log(id);

