#!/usr/bin/env bash
LOG=$1

echo -e "Analyzing $LOG...: \n"

### NUMBER OF TIMEOUTS ###
echo -e "\nNumber of timeouts:\n==="
grep "Reason:     timeout" $LOG | wc -l

## BUCKET INFO
echo -e "\nDifferent buckets:\n==="
grep "Data  ==" $LOG | colrm 100 | awk -F',' '{print $4}' | sort | uniq -c | sort

## TIME DIST
echo -e "\nTime distribution:\n==="
grep "ERROR REPORT====$" $LOG | awk '{print $1 " " $2}' | sort | uniq -c
