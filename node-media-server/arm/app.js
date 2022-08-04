#!/usr/bin/env node

const NodeMediaServer = require('node-media-server');

const config = {
  rtmp: {
    port: 1935,
    chunk_size: 60000,
    gop_cache: true,
    ping: 30,
    ping_timeout: 60,
  },
  http: {
    port: 8000,
    allow_origin: '*',
    api: true,
  },
  auth: {
    api: true,
    api_user: process.env.USERNAME || 'admin',
    api_pass: process.env.PASSWORD || 'admin',
  },
};

var nms = new NodeMediaServer(config)
nms.run();
