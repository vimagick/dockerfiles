
var webpage = require('webpage');
var frame = require('./frame');


function setCookies(page, cookies) {
    for(var i=0; i<cookies.length; i++) {
        var item = cookies[i];
        var ok = page.addCookie(item);
    }
}


function setHeaders(page, headers) {
    for(var i=0; i<headers.length; i++) {
        var item = headers[i];
        var k = item.name;
        var v = item.value;
        page.customHeaders[k] = v;
    }
}


function injectScripts(page, scripts, arr) {
    for(var i=0; i<scripts.length; i++) {
        var item = scripts[i];
        var ok = page.injectJs(item);
        arr.push(ok);
    }
}


function execScripts(page, scripts, arr) {
    for(var i=0; i<scripts.length; i++) {
        var code = scripts[i];
        var out = page.evaluate(function(code) {
            return eval(code);
        }, code);
        arr.push(out);
    }
}


function urlopen(req, callback) {

    var page = webpage.create();
    var startTime = new Date().getTime();
    var result = {
        request: req,
        serviceMetadata: [],
        injectedScriptOutput: [],
        execScriptsOutput: {
            preInjected: [],
            postInjected: [],
        },
    };

    setCookies(page, req.cookies);
    setHeaders(page, req.customRequestHeaders);

    var isDebug = req.isDebug;

    var delayTimer, timeoutTimer = setTimeout(function() {
        if(delayTimer !== undefined) {
            clearTimeout(delayTimer);
        }
        result.totalTime = new Date().getTime() - startTime;
        result.responseCategory = 'TIMEOUT';
        callback('timeout', result);
        page.close();
    }, req.timeout);

    page.settings.navigationLocked = true;
    page.settings.userAgent = req.userAgent;
    page.settings.loadImages = req.loadImages;
    page.settings.resourceTimeout = req.timeout;

    page.viewportSize = req.viewportSize;
    page.zoomFactor = req.viewportSize.zoomFactor || 1;
    page.clipRect = req.clipRectangle;
    page.scrollPosition = req.scrollTo; //FIXME: it doesn't work as expected

    page.onConsoleMessage = function(msg, lineNum, sourceId) {
        //console.log('CONSOLE: ' + msg + ' (from line #' + lineNum + ' in "' + sourceId + '")');
    };

    page.onError = function(msg, trace) {
        result.serviceMetadata.push({
            category: 'onError',
            timestamp: new Date().getTime(),
            details: msg,
        });
    };

    page.onLoadStarted = function() {
    };

    page.onLoadFinished = function(status) {
        if(status === 'success') {
            delayTimer = setTimeout(getResult, req.delayTime);
        } else {
            result.totalTime = new Date().getTime() - startTime;
            result.responseCategory = 'FAIL';
            callback('fail', result);
            page.close();
        }
    };

    page.onResourceRequested = function(request, network) {
        // TODO: allow whitelist
        for(var i=0; i<req.resourceUrlBlacklist.length; i++) {
            var black = RegExp(req.resourceUrlBlacklist[i]);
            if(black.test(request.url)) {
                network.abort();
                result.serviceMetadata.push({
                    category: 'onResourceRequested:abort',
                    timestamp: new Date().getTime(),
                    details: request.url,
                });
                return;
            }
        }
        if(isDebug) {
            result.serviceMetadata.push({
                category: 'onResourceRequested',
                timestamp: new Date().getTime(),
                details: request.url,
            });
        }
    };

    page.onResourceReceived = function(response) {
        if(response.id === 1 && response.stage === 'end') {
            result.pageResponseMetadata = response;
        }
        if(isDebug) {
            result.serviceMetadata.push({
                category: 'onResourceReceived',
                timestamp: new Date().getTime(),
                details: response.url,
            });
        }
    };

    page.onResourceTimeout = function(request) {
        result.serviceMetadata.push({
            category: 'onResourceTimeout',
            timestamp: new Date().getTime(),
            details: request.url,
        });
    };

    page.onResourceError = function(resourceError) {
        result.serviceMetadata.push({
            category: 'onResourceError',
            timestamp: new Date().getTime(),
            details: resourceError.url,
        });
    };

    page.onUrlChanged = function(targetUrl) {
        result.serviceMetadata.push({
            category: 'onUrlChanged',
            timestamp: new Date().getTime(),
            details: targetUrl,
        });
    };

    page.onNavigationRequested = function(url, type, willNavigate, main) {
        result.serviceMetadata.push({
            category: 'onNavigationRequested',
            timestamp: new Date().getTime(),
            details: url,
        });
    };

    function getResult() {
        clearTimeout(timeoutTimer);
        page.evaluate(function(result) {
            window.pjsc_meta = {};
            window.pjsc_meta.pageResponse = result.pageResponseMetadata;
            window.pjsc_meta.pageResponse.request = result.request;
        }, result);
        execScripts(page, req.execScripts.preInjected, result.execScriptsOutput.preInjected);
        injectScripts(page, req.injectedScripts, result.injectedScriptOutput);
        execScripts(page, req.execScripts.postInjected, result.execScriptsOutput.postInjected);

        var fdata = {};
        frame.frameData(page, fdata);
        fdata.content = null;
        result.frameData = fdata;
        page.switchToMainFrame();

        var pdata = null;
        switch(req.requestType) {
            case 'jpg':
            case 'png':
            case 'gif':
                var name = req.requestId + '.' + req.requestType;
                page.render('/data/' + name, {format: req.requestType, quality: req.renderQuality});
                result.pageRender = name;
                pdata = page.content;
                break
            case 'script':
                pdata = page.evaluate(function() {
                    return window.pjsc_output;
                });
                break;
            case 'plain':
                pdata = page.plainText;
                break;
            case 'text':
            default:
                pdata = page.content;
                break;
        }
        result.resultUrl = page.url;
        result.pageContent = pdata;
        result.totalTime = new Date().getTime() - startTime;
        result.responseCategory = 'OK';
        callback(null, result);
        page.close();
    }

    if(req.targetContent) {
        page.setContent(req.targetContent, req.targetUrl);
    } else {
        page.open(req.targetUrl);
    }

    return req.requestId;
}

module.exports.urlopen = urlopen;

