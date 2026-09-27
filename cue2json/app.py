#!/usr/bin/env python3

from flask import Flask, request, jsonify, Response
import pylibcue
import yaml
import json
import chardet

app = Flask(__name__)


def decode_cue(raw: bytes) -> str:
    result = chardet.detect(raw)
    encoding = result.get("encoding") or "utf-8"

    if encoding.upper() in ("GB2312", "GBK", "GB18030", "HZ-GB-2312"):
        encoding = "GB18030"

    try:
        return raw.decode(encoding)
    except (UnicodeDecodeError, LookupError):
        return raw.decode("utf-8", errors="replace")


def format_msf(t) -> str | None:
    if t is None:
        return None
    m, s, f = t
    return f"{m:02d}:{s:02d}:{f:02d}"


def cue_to_dict(cue_text: str) -> dict:
    cd = pylibcue.parse_str(cue_text)

    result = {
        "title": cd.cdtext.title,
        "performer": cd.cdtext.performer,
        "date": cd.rem.date,
        "tracks": [],
    }

    for tr in cd:
        track = {
            "number": tr.track_number,
            "title": tr.cdtext.title,
            "performer": tr.cdtext.performer,
            "filename": tr.filename,
            "start": format_msf(tr.start),
            "length": format_msf(tr.length),
        }

        for idx in (0, 1):
            val = tr.get_index(idx)
            if val is not None:
                track[f"index{idx:02d}"] = format_msf(val)

        result["tracks"].append(track)

    return result


def dict_to_cue(data: dict) -> str:
    lines = []

    if data.get("date"):
        lines.append(f'REM DATE {data["date"]}')
    if data.get("performer"):
        lines.append(f'PERFORMER "{data["performer"]}"')
    if data.get("title"):
        lines.append(f'TITLE "{data["title"]}"')
    if data.get("file"):
        lines.append(f'FILE "{data["file"]}" WAVE')

    for tr in data.get("tracks", []):
        lines.append("")
        lines.append(f'  TRACK {int(tr["number"]):02d} AUDIO')
        if tr.get("title"):
            lines.append(f'    TITLE "{tr["title"]}"')
        if tr.get("performer"):
            lines.append(f'    PERFORMER "{tr["performer"]}"')
        if tr.get("index00"):
            lines.append(f'    INDEX 00 {tr["index00"]}')
        if tr.get("index01"):
            lines.append(f'    INDEX 01 {tr["index01"]}')

    return "\n".join(lines) + "\n"


def parse_structured(raw: bytes, content_type: str) -> dict:
    text = decode_cue(raw)
    ct = (content_type or "").lower()

    if "yaml" in ct or "yml" in ct:
        return yaml.safe_load(text)

    stripped = text.lstrip()
    if stripped.startswith("{"):
        return json.loads(text)

    try:
        return yaml.safe_load(text)
    except yaml.YAMLError:
        return json.loads(text)


def is_cue_input(content_type: str) -> bool:
    ct = (content_type or "").lower()
    return ct.startswith("text/") or "cue" in ct


def get_declared_charset(content_type: str) -> str | None:
    ct = (content_type or "").lower()
    if "charset=" in ct:
        return ct.split("charset=")[-1].split(";")[0].strip().strip('"')
    return None


def wants_yaml() -> bool:
    fmt = request.args.get("fmt", "").lower()
    if fmt in ("yaml", "yml"):
        return True
    accept = (request.headers.get("Accept") or "").lower()
    return "yaml" in accept or "yml" in accept


@app.route("/", methods=["GET"])
def index():
    usage = (
        "Usage:\n"
        "\n"
        "  CUE -> JSON/YAML (Content-Type: text/plain):\n"
        "    curl -X POST http://<host>:5000/ -H 'Content-Type: text/plain' --data-binary @album.cue\n"
        "    curl -X POST 'http://<host>:5000/?fmt=yaml' -H 'Content-Type: text/plain' --data-binary @album.cue\n"
        "    curl -X POST 'http://<host>:5000/?enc=gbk'  -H 'Content-Type: text/plain' --data-binary @album.cue\n"
        "\n"
        "  JSON/YAML -> CUE (Content-Type: application/json or application/yaml):\n"
        "    curl -X POST http://<host>:5000/ -H 'Content-Type: application/json' --data-binary @album.json\n"
        "    curl -X POST http://<host>:5000/ -H 'Content-Type: application/yaml' --data-binary @album.yaml\n"
    )
    return Response(usage, mimetype="text/plain")


@app.route("/", methods=["POST"])
def handle():
    raw = request.data
    if not raw.strip():
        return jsonify({"error": "Empty request body"}), 400

    if is_cue_input(request.content_type):
        declared = get_declared_charset(request.content_type)
        forced = request.args.get("enc") or declared
        if forced:
            cue_text = raw.decode(forced, errors="replace")
        else:
            cue_text = decode_cue(raw)

        try:
            data = cue_to_dict(cue_text)
        except Exception as e:
            return jsonify({"error": f"Failed to parse CUE: {str(e)}"}), 400

        if wants_yaml():
            output = yaml.dump(data, allow_unicode=True, sort_keys=False)
            return Response(output, mimetype="application/yaml")
        return jsonify(data)

    else:
        try:
            data = parse_structured(raw, request.content_type)
        except Exception as e:
            return jsonify({"error": f"Failed to parse input: {str(e)}"}), 400

        if not isinstance(data, dict) or "tracks" not in data:
            return jsonify({"error": "Input must be an object with a 'tracks' array"}), 400

        try:
            cue_text = dict_to_cue(data)
        except Exception as e:
            return jsonify({"error": f"Failed to build CUE: {str(e)}"}), 400

        return Response(cue_text, mimetype="text/plain; charset=utf-8")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
