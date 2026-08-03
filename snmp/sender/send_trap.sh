#!/bin/bash

# Wait a few seconds for the receiver to fully start
echo "Waiting for receiver to be ready..."
sleep 5

echo "Starting SNMP Trap Sender..."

# Loop to send a trap every 10 seconds
while true; do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    
    # snmptrap -v <version> -c <community> <host> <uptime> <trapOID> <payloadOID> <type> <value>
    # Note: 'receiver' is the hostname resolved by Docker Compose
    snmptrap -v 2c -c public receiver '' 1.3.6.1.4.1.99999.1.1 1.3.6.1.4.1.99999.1.1.1 s "Test trap sent at $TIMESTAMP"
    
    sleep 10
done
