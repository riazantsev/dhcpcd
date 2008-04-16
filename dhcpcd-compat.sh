#!/bin/sh
# Compat shim for older dhcpcd versions

IPADDR=${new_ip_address}
INTERFACE=${interface}
NETMASK=${new_subnet_mask}
BROADCAST=${new_broadcast_address}
NETWORK=${new_network_address}
DHCPSID=${new_dhcp_server_identifier}
GATEWAYS=${new_routers}
DNSSERVERS=${new_domain_name_servers}
DNSDOMAIN=${new_domain_name}
DNSSEARCH=${new_domain_search}
NISDOMAIN=${new_nis_domain}
NISSERVERS=${new_nis_servers}
NTPSERVERS=${new_ntp_servers}

GATEWAY=
for x in ${new_routers}; do
	GATEWAY="${GATEWAY}${GATEWAY:+,}${x}"
done
DNS=
for x in ${new_domain_name_servers}; do
	DNS="${DNS}${DNS:+,}${x}"
done

x="down"
case "${reason}" in
	RENEW) "up";;
	BOUND|INFORM|REBIND|REBOOT|TEST|TIMEOUT|IPV4LL) x="new";;
esac
set -- "" "${x}"
