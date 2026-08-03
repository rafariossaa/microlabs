#!/bin/bash

echo "=== DEBUG: Contents of snmpd.conf being used ==="
cat /etc/snmp/snmpd.conf
echo "================================================"

# CRITICAL: Kill any snmpd processes that were auto-started by apt-get install
echo "Killing any existing snmpd processes..."
pkill -9 snmpd || true
sleep 1

# Start snmpd as root (-u root) to avoid any permission issues
snmpd -u root -f -Lo -c /etc/snmp/snmpd.conf &

# Run the trap sender in the background
/send_trap.sh &

# Keep the container alive
wait
