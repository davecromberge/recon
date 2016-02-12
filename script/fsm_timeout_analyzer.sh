#!/usr/bin/env bash
LOG=$1

echo -e "analyzing $LOG...: \n"

### NUMBER OF TIMEOUTS ###
echo -e "\nNumber of timeouts:\n==="
grep "exception exit: {timeout" $LOG | wc -l
## BUCKET INFO
echo -e "\nDifferent buckets:\n==="
grep "Data  ==" $LOG | colrm 100 | awk -F',' '{print $4}' | sort | uniq -c | sort
