FROM debian:13

# Prevent services from auto-starting and install procps
RUN apt-get update && \
    apt-get install -y snmptrapd snmp procps && \
    rm -rf /var/lib/apt/lists/*


COPY snmptrapd.conf /etc/snmp/snmptrapd.conf
COPY entrypoint.sh /entrypoint.sh
COPY poll_agent.sh /poll_agent.sh

RUN chmod +x /entrypoint.sh /poll_agent.sh

EXPOSE 162/udp

ENTRYPOINT ["/entrypoint.sh"]
