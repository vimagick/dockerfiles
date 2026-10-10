-- http_sniff.lua
-- Pretty-print HTTP/HTTPS request records with source IP and type label.

-- Declare fields (must be at file scope)
local f_ip_src      = Field.new("ip.src")
local f_ipv6_src    = Field.new("ipv6.src")
local f_http_method = Field.new("http.request.method")
local f_http_host   = Field.new("http.host")
local f_http_uri    = Field.new("http.request.uri")
local f_tls_sni     = Field.new("tls.handshake.extensions_server_name")

-- Helper: safely get string value or empty string
local function safe_str(field)
    if field == nil then return "" end
    local v = field()
    if v == nil then return "" end
    return tostring(v)
end

-- Create a listener with the same filter you use on the command line
local tap = Listener.new(nil, "http.request or tls.handshake.type==1")

-- Print header once
local header_printed = false
local function print_header()
    if header_printed then return end
    print(string.format("%-16s %-6s %-6s %-25s %-6s %-30s",
        "SRC_IP", "TYPE", "METHOD", "HOST", "PORT", "URI"))
    print(string.rep("-", 110))
    header_printed = true
end

function tap.packet(pinfo, tvb)
    local ip_src  = safe_str(f_ip_src)
    local ipv6    = safe_str(f_ipv6_src)
    local src     = ip_src ~= "" and ip_src or ipv6

    local method  = safe_str(f_http_method)
    local host    = safe_str(f_http_host)
    local uri     = safe_str(f_http_uri)
    local sni     = safe_str(f_tls_sni)

    -- Determine record type
    local rtype = ""
    if uri ~= "" then
        rtype = "HTTP"
    elseif sni ~= "" then
        rtype = "HTTPS"
    else
        return  -- skip records that match neither
    end

    -- Determine port (destination port of the TCP/UDP flow)
    local port = ""
    if pinfo.dst_port then
        port = tostring(pinfo.dst_port)
    end

    print_header()

    -- For HTTPS, host is empty but SNI is populated
    if rtype == "HTTPS" then
        host = sni
    end

    if host ~= "" then
        local ipv6_host, ipv6_port = host:match("^%[([^%]]+)%]:(%d+)$")
        if ipv6_host then
            if port == "" then port = ipv6_port end
            host = ipv6_host
        else
            local name, p = host:match("^([^:]+):(%d+)$")
            if name then
                if port == "" then port = p end
                host = name
            end
        end
    end

    print(string.format("%-16s %-6s %-6s %-25s %-6s %-30s",
        src, rtype, method, host, port, uri))
end

-- Cleanup (optional)
function tap.reset()
    header_printed = false
end
