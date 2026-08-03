FROM debian:13

# Force rebuild by using a build arg (we will pass a random number)
ARG CACHEBUST=1

RUN apt-get update && \
    apt-get install -y snmpd snmp && \
    rm -rf /var/lib/apt/lists/*

COPY snmpd.conf /etc/snmp/snmpd.conf
COPY entrypoint.sh /entrypoint.sh
COPY send_trap.sh /send_trap.sh

RUN chmod +x /entrypoint.sh /send_trap.sh

EXPOSE 1161/udp

ENTRYPOINT ["/entrypoint.sh"]
