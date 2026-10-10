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
    print(string.format("%-16s %-6s %-6s %-25s %-30s %s",
        "SRC_IP", "TYPE", "METHOD", "HOST", "URI", "SNI"))
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
        rtype = "http"
    elseif sni ~= "" then
        rtype = "https"
    else
        return  -- skip records that match neither
    end

    print_header()

    -- For HTTPS, host is empty but SNI is populated
    if rtype == "https" then
        host = sni
    end

    print(string.format("%-16s %-6s %-6s %-25s %-30s %s",
        src, rtype, method, host, uri, sni))
end

-- Cleanup (optional)
function tap.reset()
    header_printed = false
end
