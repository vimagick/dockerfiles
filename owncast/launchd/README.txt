1. Download owncast-macOS.zip from https://github.com/owncast/owncast/releases
2. Download ffmpeg.zip from
       - https://evermeet.cx/ffmpeg/
       - https://ffmpeg.martin-riedl.de/
3. Unzip executable files to /usr/local/bin/
4. Create launchd file: ~/Library/LaunchAgents/owncast.plist
5. Run command: launchctl bootstrap user/501 ~/Library/LaunchAgents/owncast.plist
6. Open web browser: http://127.0.0.1:8080/admin (admin:abc123)
7. OBS live stream to: rtmp://127.0.0.1/live (abc123)
