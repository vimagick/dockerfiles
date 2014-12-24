
var utils = require('./utils');

var setDefaults = function(req) {

    /*
    - isDebug
    - requestId
    - targetUrl (required)
    - targetContent
    - requestType
    - timeout
    - loadImages
    - delayTime
    - userAgent
    - resourceUrlWhitelist (FIXME)
    - resourceUrlBlacklist
    - viewportSize
    - clipRectangle
    - scrollTo (FIXME)
    - injectedScripts
    - execScripts (FIXME: targetPageLoaded)
    */

    if(req.isDebug === undefined) {
        req.isDebug = false;
    } else if(typeof req.isDebug !== 'boolean') {
        throw 'isDebug: type-error';
    }

    if(req.requestId === undefined) {
        req.requestId = utils.guid();
    } else if(typeof req.requestId !== 'string') {
        throw 'requestId: type-error';
    }

    if(req.userAgent === undefined) {
        req.userAgent = 'Mozilla/5.0 PhantomJS/1.9.8';
    } else if(typeof req.userAgent !== 'string') {
        throw 'userAgent: type-error';
    }

    if(req.targetUrl === undefined) {
        throw 'targetUrl: missing';
    } else if(typeof req.targetUrl !== 'string') {
        throw 'targetUrl: type-error';
    }

    if(req.targetContent === undefined) {
    } else if(typeof req.targetContent !== 'string') {
        throw 'targetContent: type-error';
    }

    if(req.requestType === undefined) {
        req.requestType = 'text';
    } else if(typeof req.requestType !== 'string') {
        throw 'targetType: type-error';
    }

    if(req.delayTime === undefined) {
        req.delayTime = 0;
    } else if(typeof req.delayTime !== 'number') {
        throw 'delayTime: type-error';
    } else if(req.delayTime < 0 || req.delayTime > 300000) {
        throw 'delayTime: out-of-range';
    }

    if(req.timeout === undefined) {
        req.timeout = 60000;
    } else if(typeof req.timeout !== 'number') {
        throw 'timeout: type-error';
    } else if(req.timeout < 1000 || req.timeout > 300000) {
        throw 'timeout: out-of-range';
    }

    if(req.loadImages === undefined) {
        req.loadImages = false;
    } else if(typeof req.loadImages !== 'boolean') {
        throw 'timeout: type-error';
    }

    if(req.cookies === undefined) {
        req.cookies = [];
    } else if(req.cookies.length === undefined) {
        throw 'cookies: type-error';
    }

    if(req.customRequestHeaders === undefined) {
        req.customRequestHeaders = [];
    } else if(req.customRequestHeaders.length === undefined) {
        throw 'customRequestHeaders: type-error';
    }

    if(req.resourceUrlWhitelist === undefined) {
        req.resourceUrlWhitelist = [];
    } else if(req.resourceUrlWhitelist.length === undefined) {
        throw 'resourceUrlWhitelist: type-error';
    }

    if(req.resourceUrlBlacklist === undefined) {
        req.resourceUrlBlacklist = []; // set it to ['.*\.css.*'] to block stylesheet
    } else if(req.resourceUrlBlacklist.length === undefined) {
        throw 'resourceUrlBlacklist: type-error';
    }

    if(req.viewportSize === undefined) {
        req.viewportSize = {width: 800, height: 600, zoomFactor: 1};
    } else if(typeof req.viewportSize !== 'object') {
        throw 'viewportSize: type-error';
    }

    if(req.clipRectangle === undefined) {
        req.clipRectangle = {top: 0, left: 0, width: 0, height: 0};
    } else if(typeof req.clipRectangle !== 'object') {
        throw 'clipRectangle: type-error';
    }

    if(req.scrollTo === undefined) {
        req.scrollTo = {top: 0, left: 0};
    } else if(typeof req.scrollTo !== 'object') {
        throw 'scrollTo: type-error';
    }

    if(req.injectedScripts === undefined) {
        req.injectedScripts = [];
    } else if(req.injectedScripts.length === undefined) {
        throw 'injectedScripts: type-error';
    }

    if(req.execScripts === undefined) {
        req.execScripts = {preInjected: [], postInjected: []};
    } else if(typeof req.execScripts !== 'object') {
        throw 'execScripts: type-error';
    }

    return req;
}

module.exports.setDefaults = setDefaults;

