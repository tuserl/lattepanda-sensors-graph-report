#!/bin/bash

LOGFILE="sensor_log.csv"

# Write CSV header if not exists
if [ ! -f "$LOGFILE" ]; then
    echo "timestamp,core0" > "$LOGFILE"
fi

while true; do
    timestamp=$(date +%s)
    core0=$(sensors | grep 'Core 0:' | awk '{gsub("\\+|°C", "", $3); print $3}')
    echo "$timestamp,$core0" >> "$LOGFILE"
    sleep 1
done
