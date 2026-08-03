FROM debian:13

ARG CACHEBUST=1

# 1. Prevent services from auto-starting during apt-get install
# 2. Install snmpd, snmp tools
RUN apt-get update && \
    apt-get install -y snmpd snmp 

COPY snmpd.conf /etc/snmp/snmpd.conf
COPY entrypoint.sh /entrypoint.sh
COPY send_trap.sh /send_trap.sh

RUN chmod +x /entrypoint.sh /send_trap.sh

EXPOSE 1161/udp

ENTRYPOINT ["./entrypoint.sh"]
