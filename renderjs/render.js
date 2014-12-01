#!/usr/bin/env phantomjs
/*
 * Webpage Rendering Service
 * =========================
 *
 * SERVER
 * ------
 *
 * $ phantomjs render.js 8080
 *
 *
 * CLIENT
 * ------
 *
 * $ http :8080 url=http://www.python.org timeout=5000 wait=1000
 *
 */

sys = require('system');
svr = require('webserver').create();

if(sys.args.length > 2) {
  console.log('Usage: phantomjs render.js [port]');
  phantom.exit(1);
}

port = parseInt(sys.args[1]) || 8080;

service = svr.listen(port, function(request, response){

  if(request.method === 'POST'){
    try{
      var raw = request.postRaw || request.post || '{}',
          qs = JSON.parse(raw),
          style = qs.style || false,
          image = qs.image || false,
          shot = qs.shot || false,
          content = qs.content || '',
          proxy = qs.proxy || '',
          method = qs.method || 'get',
          url = qs.url,
          headers = qs.headers || {},
          data = qs.data || '',
          wait = qs.wait || 1000,
          timeout = qs.timeout || 30000;
      if(!/^https?:\/\//.test(url)){
        throw 'bad request';
      }
    }catch(e){
      log(e);
      return send(page, request, response, 400);
    }
  }else{
    return send(page, request, response, 405);
  }

  log('recv:', url);

  //create PAGE object
  var page = require('webpage').create();

  //set headers
  headers['Accept-Encoding'] = 'identity';
  page.customHeaders = headers;

  //no error message
  page.onError = null;

  //load images (yes/no)
  page.settings.loadImages = image;

  //load style (yes/no)
  if(!style){
    page.onResourceRequested = function(requestData, request) {
      var url = requestData['url'],
          type = requestData.headers['Content-Type'];
      if((/http:\/\/.+?\.css/gi).test(url) || type == 'text/css') {
        request.abort();
      }
    };
  }

  //set cookies (yes/no)
  phantom.clearCookies();
  var cs = headers['Cookie'];
  if(cs){
    delete headers['Cookie'];
    cs = parse_cookies(url, cs);
    for(var i=0; i<cs.length; i++){
      phantom.addCookie(cs[i]);
    }
  }

  //set user-agent (yes/no)
  var ua = headers['User-Agent'];
  if(ua){
    delete headers['User-Agent'];
    page.settings.userAgent = ua;
  }

  //set content (yes/no)
  if(content){
    log('input:', content.length, 'bytes')
    page.setContent(content, url);
    send_later(page, request, response, wait, shot);
    return;
  }

  //set timeout
  var tid = setTimeout(function(){
    log('timeout:', url);
    send(page, request, response, 504);
    page.close();
  }, timeout);

  //open url
  page.open(url, method, data, function(status){
    clearTimeout(tid);
    if(status!=='success'){
      return send(page, request, response, 500);
    }

    page.evaluate(function() {
      document.body.bgColor = 'white';
    });

    send_later(page, request, response, wait, shot);
  });

});

function log(){
  var now = new Date().getTime()/1000;
  var args = Array.prototype.slice.call(arguments);
  args.unshift('['+now.toFixed(3)+']');
  console.log(args.join(' '));
}

function send(page, request, response, code, html){
  response.statusCode = code;
  response.setHeader('X-Powered-By', 'PhantomJS')

  if(request.url.indexOf('json')>=0){
    var ctype = 'application/json';
    var content = JSON.stringify({
      'headers': page.customHeaders,
      'cookies': page.cookies,
      'content': html
    });
  }else{
    var ctype = 'text/html';
    var content = html || '';
  }

  response.setHeader('Content-Type', ctype)
  response.write(content);
  response.close();
}

function send_later(page, request, response, wait, shot){
  log('wait:', wait);
  var wid = setTimeout(function(){
    log('send:', page.url);
    log('output:', page.content.length, 'bytes')
    send(page, request, response, 200, page.content);
    if(shot){
      var fn = '/tmp/'+(new Date()).getTime()+'.png';
      log('shot:', fn);
      page.render(fn);
    }
    page.close();
  }, wait);
}

function parse_cookies(url, cs){
  var domain = url.match(/https?:\/\/([^\/]+)/)[1]
  var cookies = cs.split('; ');
  for(var i=0; i<cookies.length; i++){
    var cookie = cookies[i];
    index = cookie.indexOf('=');
    cookie = {
      'name': cookie.substring(0, index),
      'value': cookie.substring(index+1),
      'domain': domain,
      'path': '/'
    }
    cookies[i] = cookie;
  }
  return cookies;
}

log('Webpage Rendering Service');
if(service){
  log('listen port', port, '...');
}else{
  log('listen port', port, 'faild');
  phantom.exit(2);
}

