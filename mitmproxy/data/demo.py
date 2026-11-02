#!/usr/bin/env python3
#
# mitmdump --mode reverse:https://httpbin.org:443@127.0.0.1:8080 -s demo.py
# curl -X POST http://127.0.0.1:8080/post -d "foo=bar&baz=qux"
#

import json
from mitmproxy import http, ctx

def request(flow: http.HTTPFlow) -> None:
    # Only handle POST requests
    if flow.request.method != "POST":
        return

    content_type = flow.request.headers.get("Content-Type", "")

    # Only handle form-urlencoded requests
    if "application/x-www-form-urlencoded" not in content_type:
        return

    try:
        # urlencoded_form is mitmproxy's built-in MultiDict parser
        form_data = flow.request.urlencoded_form

        if not form_data:
            return

        # Convert MultiDict to a plain dict, taking the first value per key
        json_data = {key: form_data[key] for key in form_data}

        # Replace the request body with JSON
        flow.request.text = json.dumps(json_data)
        flow.request.headers["Content-Type"] = "application/json"

        ctx.log.info(f"Converted form to JSON: {flow.request.url}")

    except Exception as e:
        ctx.log.error(f"Failed to convert form to JSON: {e}")
