io.stdout:setvbuf 'no'

function read_query(packet)
    if packet:byte() == proxy.COM_QUERY then
        print("we got a normal query: " .. packet:sub(2))
    end
end
