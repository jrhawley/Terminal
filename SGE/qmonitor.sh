#!/bin/bash

# verbose failures
set -o nounset -o pipefail -o errexit

TO_MONITOR=""
LAST_KNOWN_NUM_JOBS=0
if [ "$#" -eq 1 ]; then
    if [ "$1" == "-" ]; then
        TO_MONITOR=`qstat | tail -n +2 | cut -f 1 -d ' ' | sort -nr | head -n1`
    else
        TO_MONITOR=$1
    fi
fi

while true; do
    clear && printf '\e[3J'
    python ./qavail.py "$TO_MONITOR"
    echo
    qstat -g c

    # If we're supposed to monitor a job, ring a bell when it finishes
    if [ "$TO_MONITOR" != "" ]; then
        set +e
        qstat -j $TO_MONITOR >/dev/null 2>&1
        if [ "$?" -eq "1" ]; then
            tput bel
            echo "Job $TO_MONITOR has ended"
        fi
        set -e
    else
        # If we're not supposed to monitor a job, ring a bell whenever the # of jobs decreases
        NUM_JOBS=`qstat | wc -l`
        if [ "$NUM_JOBS" -lt "$LAST_KNOWN_NUM_JOBS" ]; then
            tput bel
            echo "Job(s) have ended"
        fi
        LAST_KNOWN_NUM_JOBS=$NUM_JOBS
    fi
    sleep 30
done
