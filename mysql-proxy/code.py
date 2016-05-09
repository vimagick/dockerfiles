#!/usr/bin/env python3

import select from systemd
import journal

j = journal.Reader()
j.log_level(journal.LOG_INFO)
j.add_match(CONTAINER_NAME="mysql-proxy")
j.seek_tail()
j.get_previous()

p = select.poll()
p.register(j, j.get_events())

while p.poll():
    if j.process() != journal.APPEND:
        continue
    for entry in j:
        if entry['MESSAGE']:
            print(str(entry['__REALTIME_TIMESTAMP']), entry['MESSAGE'])
