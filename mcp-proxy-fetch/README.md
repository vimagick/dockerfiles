mcp-proxy-fetch
===============

[fetch][1] is a MCP server that provides web content fetching capabilities.
This server enables LLMs to retrieve and process content from web pages,
converting HTML to markdown for easier consumption.

> [!CAUTION]
> This server can access local/internal IP addresses and may represent a security risk.
> Exercise caution when using this MCP server to ensure this does not expose any sensitive data.

## docker-compose.yaml

```yaml
services:
  fetch:
    image: easypi/mcp-proxy-fetch
    command: "--host=0.0.0.0 --port=5757 -- mcp-server-fetch --ignore-robots-txt --user-agent=Mozilla/5.0 --proxy-url=http://192.168.1.1:8081"
    ports:
      - "5757:5757"
    restart: unless-stopped
```

## Test API

You can use the [mcp-inspector][2] to test the target mcp server.

```yaml
services:
  mcp-inspector:
    image: ghcr.io/modelcontextprotocol/inspector
    ports:
      - "6274:6274"
      - "6275:6275"
    volumes:
      - ./data:/home/node/.mcp-inspector
    environment:
      - DANGEROUSLY_OMIT_AUTH=true
    restart: unless-stopped
```

## MCP Client

[ChatGPT CLI][3] is a powerful, multi-provider command-line interface for working with modern LLMs.

```bash
$ chatgpt -n -i --tools --mcp http://127.0.0.1:5757/mcp
Entering interactive mode. Using thread 'cmd_6d16'. Multiline mode is OFF.
Commands: 'clear' (clear screen), 'multiline' (toggle multiline input), 'exit' or Ctrl+C (quit).

[2026-08-19 07:03:52] [Q1] [0] list tools
Here are the tools I have access to:

## Tools Available

| Tool | Description |
|------|-------------|
| **fetch** | Fetches a URL from the internet and optionally extracts its contents as markdown or raw HTML content. You control what you get back by setting parameters like max length and character start index. |

### Fetch Tool Details

**Parameters:**
- `url` (required) - The URL to fetch
- `max_length` (optional, default 5000) - Maximum number of characters to return
- `start_index` (optional, default 0) - Output starting position for truncated content
- `raw` (optional, default false) - When enabled, returns actual HTML without simplification; otherwise returns markdown format

This tool enables me to help you retrieve web page content, articles, documentation, or any publicly accessible URL content when needed.

---

Would you like me to fetch something specific using this tool?
```

[1]: https://github.com/modelcontextprotocol/servers/tree/main/src/fetch
[2]: https://github.com/modelcontextprotocol/inspector/blob/main/docs/docker.md
[3]: https://github.com/kardolus/chatgpt-cli