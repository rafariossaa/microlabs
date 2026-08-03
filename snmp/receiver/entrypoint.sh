#!/bin/bash
# Start the Trap Daemon in the background, logging to stdout
snmptrapd -f -Lo -c /etc/snmp/snmptrapd.conf &

# Run the polling script in the background
/poll_agent.sh &

# Keep the container alive and wait for both processes
wait
