#!/bin/bash
host=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
ram=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }' | sed 's/[ \t]*$//')
disk=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}' | sed 's/[ \t]*$//')
cpu=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}' | sed 's/[ \t]*$//')
json='{"host":"'"$host"'", "ram":"'"$ram"'", "cpu":"'"$cpu"'", "disk":"'"$disk"'"}'
echo -e "$json" >> /tmp/health.json
