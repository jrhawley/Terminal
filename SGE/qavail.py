"""
qavail.py
=========
Monitor cluster usage
"""

import os
import re
import sys

from tabulate import tabulate

QSTAT = os.popen("qstat -u '*' " + " ".join(sys.argv[1:]), "r")
LINES_READ = 0
USERS = {}
JOB_STATS = {}
SLOTS_POSITION = 0

# Figure out where the user/queue is
USER_START = 0
USER_END = 0
QUEUE_START = 0
QUEUE_END = 0
for line in QSTAT:
    LINES_READ += 1
    if LINES_READ < 4:
        # Parse out header to get position of the number of slots consumed
        if LINES_READ == 1:
            USER_START = line.find("user")
            USER_END = line.find("state")
            QUEUE_START = USER_END
            QUEUE_END = line.find("submit")
            SLOTS_POSITION = re.search(r'slots', line).span()[1]

        # ...and skip the rest of the header
        LINES_READ += 1
        continue

    re_out = re.search(r'(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+', line)
    if re_out is None:
        print(line)
    else:
        user = line[USER_START:USER_END]
        queue = line[QUEUE_START:QUEUE_END]
        if queue not in JOB_STATS:
            JOB_STATS[queue] = {}

        # Figure out number of jobs to count this line as
        slots = 0
        array_search = re.search(r'(\d+)-(\d+):\d\s+', line)
        if array_search:
            slots = int(array_search.group(2)) - int(array_search.group(1)) + 1
        else:
            slot_search = re.search(r'([0-9]+)\s*$', line[0:SLOTS_POSITION])
            if not slot_search:
                print(line)
            slots = int(slot_search.group(1))
        if user in JOB_STATS[queue]:
            JOB_STATS[queue][user] += slots
        else:
            JOB_STATS[queue][user] = slots

# Sort each queue of users
NUM_ROWS = max([len(JOB_STATS[queue]) for queue in JOB_STATS])
FINAL_LIST = [()] * NUM_ROWS
STATUS_ORDER = sorted(JOB_STATS.keys(), reverse=True)
for status in STATUS_ORDER:
    queue = JOB_STATS[status]
    sorted_users = sorted(
        queue.items(), key=lambda queue: queue[1], reverse=True)
    for i in range(len(sorted_users), NUM_ROWS):
        sorted_users.append(('', ''))
    FINAL_LIST = [sum(zipped, ()) for zipped in zip(FINAL_LIST, sorted_users)]

# Prepare table header and print
HEADER = [('user', queue.strip()) for queue in STATUS_ORDER]
HEADER = list(sum(HEADER, ()))  # Flatten the list
print(tabulate(FINAL_LIST, headers=HEADER))
