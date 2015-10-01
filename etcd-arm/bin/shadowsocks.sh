#!/bin/bash
#
# free shadowsocks
#

{
  echo 'server,server_port,password,method,local_address,local_port,timeout'
  curl -s 'http://www.ishadowsocks.com/' |
    sed -n '/<section id="free"/,/section>/{/font/d;p}' |
      grep -oP '(?<=<h4>).*(?=</h4>)' |
        cut -d : -f 2 |
          sed -e 'N;N;N;s/\n/,/g' \
              -e 's/$/,0.0.0.0/' \
              -e 's/$/,1080/' \
              -e 's/$/,300/'
} |
  csvjson |
    jq -c 'map(
            .fast_open = true |
              with_entries(
                .key as $key |
                  if ((["server_port", "local_port", "timeout"] | index($key)) == null)
                  then
                    .
                  else
                    (.value |= tonumber)
                  end
              )
         )[]' |
      while read line
      do
        server=$(echo "$line" | jq -r .server)
        etcdctl -C 192.168.1.228:2379 set "/services/shadowsocks/$server" "$line"
      done

