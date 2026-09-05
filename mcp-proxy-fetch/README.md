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

## 

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

[1]: https://github.com/modelcontextprotocol/servers/tree/main/src/fetch
[2]: https://github.com/modelcontextprotocol/inspector/blob/main/docs/docker.md