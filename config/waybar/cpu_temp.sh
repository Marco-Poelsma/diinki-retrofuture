#!/bin/bash
USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)
TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
TEMP=$((TEMP / 1000))

CLASS="normal"
[ "$TEMP" -ge 75 ] && CLASS="warning"
[ "$TEMP" -ge 80 ] && CLASS="critical"

echo "{\"text\": \"CPU(${USAGE}% ${TEMP}ºC)\", \"class\": \"${CLASS}\"}"