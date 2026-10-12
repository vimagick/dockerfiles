#!/usr/bin/env python3

import dataclasses
import json
import tldextract
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import urlparse, parse_qs


EXTRACTOR = tldextract.TLDExtract(suffix_list_urls=())
PROPS = (
    "fqdn",
    "ipv4",
    "ipv6",
    "registered_domain",
)

MAX_BODY = 1 << 20  # 1 MiB


def extract_one(value, include_private=False):
    e = EXTRACTOR(value, include_psl_private_domains=include_private)
    return {**dataclasses.asdict(e), **{p: getattr(e, p) for p in PROPS}}


def extract_many(values, include_private=False):
    results = [extract_one(v, include_private) for v in values]
    return results[0] if len(results) == 1 else results


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        u = urlparse(self.path)
        q = parse_qs(u.query)

        if u.path == "/health":
            return self._json({"status": "ok"})

        if u.path != "/extract":
            return self._json({"error": "not found"}, 404)

        values = q.get("input", [])
        if not values:
            return self._json({"error": "`input` must be given at least once"}, 400)

        include_private = q.get("include_private", ["false"])[0].lower() == "true"
        return self._json(extract_many(values, include_private))

    def do_POST(self):
        u = urlparse(self.path)

        if u.path == "/update":
            try:
                EXTRACTOR.update(fetch_now=True)
                return self._json({"status": "updated"})
            except Exception as exc:
                return self._json({"error": str(exc)}, 500)

        if u.path == "/extract":
            return self._handle_post_extract()

        return self._json({"error": "not found"}, 404)

    def _handle_post_extract(self):
        try:
            length = int(self.headers.get("Content-Length") or 0)
        except ValueError:
            return self._json({"error": "invalid Content-Length"}, 400)

        if length <= 0:
            return self._json({"error": "empty request body"}, 400)
        if length > MAX_BODY:
            return self._json({"error": "request body too large"}, 413)

        raw = self.rfile.read(length)
        try:
            payload = json.loads(raw)
        except json.JSONDecodeError as exc:
            return self._json({"error": f"invalid JSON: {exc}"}, 400)

        if not isinstance(payload, dict):
            return self._json({"error": "body must be a JSON object"}, 400)

        inp = payload.get("input")
        if isinstance(inp, str):
            values = [inp]
        elif isinstance(inp, list) and all(isinstance(x, str) for x in inp):
            values = inp
        else:
            return self._json(
                {"error": "`input` must be a string or list of strings"}, 400
            )

        if not values:
            return self._json({"error": "`input` must not be empty"}, 400)

        include_private = bool(payload.get("include_private", False))
        return self._json(extract_many(values, include_private))

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
