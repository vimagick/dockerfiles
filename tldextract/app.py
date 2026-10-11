#!/usr/bin/env python3

import dataclasses
import json
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import urlparse, parse_qs

import tldextract

EXTRACTOR = tldextract.TLDExtract(suffix_list_urls=())
PROPS = (
    "fqdn",
    "ipv4",
    "ipv6",
    "registered_domain",
    "reverse_domain_name",
    "top_domain_under_public_suffix",
    "top_domain_under_registry_suffix",
)


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        u = urlparse(self.path)
        q = parse_qs(u.query)

        if u.path == "/health":
            return self._json({"status": "ok"})
    
        if u.path != "/extract":
            return self._json({"error": "not found"}, 404)

        values = q.get("input", [])
        if len(values) != 1:
            return self._json({"error": "`input` must be given exactly once"}, 400)

        include_private = q.get("include_private", ["false"])[0].lower() == "true"

        e = EXTRACTOR(values[0], include_psl_private_domains=include_private)
        result = {**dataclasses.asdict(e), **{p: getattr(e, p) for p in PROPS}}
        return self._json(result)

    def do_POST(self):
        u = urlparse(self.path)

        if u.path == "/update":
            try:
                EXTRACTOR.update(fetch_now=True)
                return self._json({"status": "updated"})
            except Exception as exc:
                return self._json({"error": str(exc)}, 500)

        return self._json({"error": "not found"}, 404)

    def _json(self, obj, status=200):
        body = json.dumps(obj).encode()
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, fmt, *args):
        pass

if __name__ == "__main__":
    ThreadingHTTPServer(("0.0.0.0", 8000), Handler).serve_forever()
