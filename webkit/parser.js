
var utils = require('./utils');
var _ = utils._;
var _s = utils._s;


var setDefaults = function(req) {
    req.clipRectangle = checkObject('clipRectangle', req.clipRectangle, {top: 0, left: 0, width: 0, height: 0});
    req.cookies = checkArray('cookies', req.cookies, []);
    req.customRequestHeaders = checkArray('customRequestHeaders', req.customRequestHeaders, []);
    req.delayTime = checkNumber('delayTime', req.delayTime, 0, 300000, 0);
    req.execScripts = checkObject('execScripts', req.execScripts, {preInjected: [], postInjected: []});
    req.injectedScripts = checkArray('injectedScripts', req.injectedScripts, []);
    req.isDebug = checkBoolean('isDebug', req.isDebug, false);
    req.loadImages = checkBoolean('loadImages', req.loadImages, false);
    req.outputAsJson = checkBoolean('outputAsJson', req.outputAsJson, true); //FIXME: it is ignored
    req.requestId = checkString('requestId', utils.guid()); // ignore user input
    req.requestType = checkString('requestType', req.requestType, 'text');
    req.resourceUrlBlacklist = checkArray('resourceUrlBlacklist', req.resourceUrlBlacklist, []); //HINT: set it to ['.*\.css.*'] to block stylesheet
    req.resourceUrlWhitelist = checkArray('resourceUrlWhitelist', req.resourceUrlWhitelist, []); //FIXME: not implemented
    req.scrollTo = checkObject('scrollTo', req.scrollTo, {top: 0, left: 0}); //FIXME: it doesn't work as expected
    req.targetContent = checkString('targetContent', req.targetContent, '');
    req.targetUrl = checkString('targetUrl', req.targetUrl); // required
    req.timeout = checkNumber('timeout', req.timeout, 1000, 300000, 60000);
    req.userAgent = checkString('userAgent', req.userAgent, 'Mozilla/5.0 WebKit');
    req.viewportSize = checkObject('viewportSize', req.viewportSize, {width: 800, height: 600, zoomFactor: 1});
    req.renderQuality = checkNumber('renderQuality', req.renderQuality, 0, 100, 50);
    return req;
}


function checkNumber(name, value, min, max, defaultValue) {
    if(_.isUndefined(value)) {
        if(_.isUndefined(defaultValue)) {
            throw _s.sprintf('ValueError: `%s` is undefined', name);
        } else {
            return defaultValue;
        }
    } else if(!_.isNumber(value)) {
        throw _s.sprintf('TypeError: `%s` is not a number', name);
    } else if(value < min || value > max) {
        throw _s.sprintf('ValueError: `%s` is out of range [%d, %d]', name, min, max);
    } else {
        return value;
    }
}


function checkBoolean(name, value, defaultValue) {
    if(_.isUndefined(value)) {
        if(_.isUndefined(defaultValue)) {
            throw _s.sprintf('ValueError: `%s` is undefined', name);
        } else {
            return defaultValue;
        }
    } else if(!_.isBoolean(value)) {
        throw _s.sprintf('TypeError: `%s` is not a boolean', name);
    } else {
        return value;
    }
}


function checkString(name, value, defaultValue) {
    if(_.isUndefined(value)) {
        if(_.isUndefined(defaultValue)) {
            throw _s.sprintf('ValueError: `%s` is undefined', name);
        } else {
            return defaultValue;
        }
    } else if(!_.isString(value)) {
        throw _s.sprintf('TypeError: `%s` is not a string', name);
    } else {
        return value;
    }
}


function checkArray(name, value, defaultValue) {
    if(_.isUndefined(value)) {
        if(_.isUndefined(defaultValue)) {
            throw _s.sprintf('ValueError: `%s` is undefined', name);
        } else {
            return defaultValue;
        }
    } else if(!_.isArray(value)) {
        throw _s.sprintf('TypeError: `%s` is not a array', name);
    } else {
        return value;
    }
}


function checkObject(name, value, defaultValue) {
    if(_.isUndefined(value)) {
        if(_.isUndefined(defaultValue)) {
            throw _s.sprintf('ValueError: `%s` is undefined', name);
        } else {
            return defaultValue;
        }
    } else if(!_.isObject(value)) {
        throw _s.sprintf('TypeError: `%s` is not a object', name);
    } else {
        _.defaults(value, defaultValue);
        return value;
    }
}


module.exports.setDefaults = setDefaults;

