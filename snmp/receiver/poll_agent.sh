#!/bin/bash
echo "Starting SNMP Manager... Polling 'sender' agent every 5 seconds (Pull)."
sleep 5

while true; do
    TIMESTAMP=$(date +"%H:%M:%S")
    
    # Notice the ':1161' added to the hostname 'sender'
    CPU_LOAD=$(snmpget -v 2c -c public sender:1161 .1.3.6.1.4.1.2021.10.1.3.1 2>/dev/null | awk -F'STRING: ' '{print $2}' | tr -d '"')
    TOTAL_RAM=$(snmpget -v 2c -c public sender:1161 .1.3.6.1.4.1.2021.4.5.0 2>/dev/null | awk '{print $4}')
    AVAIL_RAM=$(snmpget -v 2c -c public sender:1161 .1.3.6.1.4.1.2021.4.6.0 2>/dev/null | awk '{print $4}')
    
    if [ -z "$CPU_LOAD" ]; then CPU_LOAD="Waiting..."; fi
    if [ -z "$TOTAL_RAM" ]; then TOTAL_RAM="0"; fi
    if [ -z "$AVAIL_RAM" ]; then AVAIL_RAM="0"; fi

    echo "[$TIMESTAMP] CPU Load (1m): $CPU_LOAD | RAM: ${AVAIL_RAM}kB / ${TOTAL_RAM}kB"
    sleep 5
done
