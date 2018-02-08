#!/bin/bash
#$ -q hoffmangroup
#$ -cwd

# verbose failures
set -o nounset -o pipefail -o errexit

i=0
while true; do
    clear
    echo $i
    qstat | head
    i=$((i+1))
    sleep 1
done
