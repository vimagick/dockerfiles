
var _ = require('./includes/underscore');
var _s = require("./includes/underscore.string");

var log = function() {
    if(arguments.length < 2) {
        throw 'Error: log(lvl, fmt, ...)';
    }
    var args = Array.prototype.slice.call(arguments);
    var lvl = args.shift();
    var args = _.map(args, function(x) {
        if(typeof x === 'object') {
            return JSON.stringify(x);
        } else {
            return x;
        }
    });
    var now = new Date().toISOString();
    var msg = _s.sprintf.apply(null, args);
    console.log(_s.sprintf('%s [%s] %s', now, lvl, msg));
}

var debug = function() {
    var args = ['DEBUG'].concat(Array.prototype.slice.call(arguments));
    log.apply(null, args);
}

var info = function() {
    var args = ['INFO'].concat(Array.prototype.slice.call(arguments));
    log.apply(null, args);
}

var warn = function() {
    var args = ['WARN'].concat(Array.prototype.slice.call(arguments));
    log.apply(null, args);
}

var error = function() {
    var args = ['ERROR'].concat(Array.prototype.slice.call(arguments));
    log.apply(null, args);
}

var guid = (function() {
    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
    }
    return function() {
        return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
    };
})();

module.exports.guid = guid;
module.exports.log = log;
module.exports.debug = debug;
module.exports.info = info;
module.exports.warn = warn;
module.exports.error = error;
module.exports._ = _;
module.exports._s = _s;

