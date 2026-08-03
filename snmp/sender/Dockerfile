FROM debian:13

ARG CACHEBUST=1

# 1. Prevent services from auto-starting during apt-get install
# 2. Install snmpd, snmp tools, and procps (for pkill)
RUN echo 'exit 101' > /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d && \
    apt-get update && \
    apt-get install -y snmpd snmp procps && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /usr/sbin/policy-rc.d

COPY snmpd.conf /etc/snmp/snmpd.conf
COPY entrypoint.sh /entrypoint.sh
COPY send_trap.sh /send_trap.sh

RUN chmod +x /entrypoint.sh /send_trap.sh

EXPOSE 1161/udp

ENTRYPOINT ["/entrypoint.sh"]
