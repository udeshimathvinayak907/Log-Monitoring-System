#!/bin/bash
echo "Log monitoring started"
while true
do
grep "Failed password" sample.log | awk '{print $6}' | sort | uniq -c | awk '$1 > 1' > alerts.txt
if [ -s alerts.txt ]
then
echo "Suspicious activity detected:"
cat alerts.txt
fi
sleep 5
done

