FROM debian:13

# Install the Trap Daemon (snmptrapd) and tools to poll agents (snmp)
RUN apt-get update && \
    apt-get install -y snmptrapd snmp && \
    rm -rf /var/lib/apt/lists/*

COPY snmptrapd.conf /etc/snmp/snmptrapd.conf
COPY entrypoint.sh /entrypoint.sh
COPY poll_agent.sh /poll_agent.sh

RUN chmod +x /entrypoint.sh /poll_agent.sh
EXPOSE 162/udp

ENTRYPOINT ["/entrypoint.sh"]
