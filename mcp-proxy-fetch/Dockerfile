#
# Dockerfile for mcp-proxy-fetch
#

ARG MCP_PROXY_VERSION
FROM sparfenyuk/mcp-proxy:${MCP_PROXY_VERSION}
RUN python -m ensurepip --upgrade && pip3 install mcp-server-fetch