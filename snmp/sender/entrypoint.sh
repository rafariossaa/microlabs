#!/bin/bash

echo "=== DEBUG: Contents of snmpd.conf being used ==="
cat /etc/snmp/snmpd.conf
echo "================================================"

# Start snmpd as root (-u root) to avoid any permission issues
snmpd -u root -f -Lo &

# Run the trap sender in the background
/send_trap.sh &

# Keep the container alive
wait
