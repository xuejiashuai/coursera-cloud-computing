#!/bin/bash

LOG1="files/Chapter-08/logs/u_ex150721.log"
LOG2="files/Chapter-08/logs/u_ex151002.log"

echo "Top 5 IPs causing HTTP 404 errors:"

cat "$LOG1" "$LOG2" | \
awk '$9 == 404 {print $8}' | \
sort | \
uniq -c | \
sort -nr | \
head -n 5
