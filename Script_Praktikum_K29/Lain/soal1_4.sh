#!/bin/bash
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet dhcp
auto eth1
iface eth1 inet static
    address 10.78.1.1
    netmask 255.255.255.0
auto eth2
iface eth2 inet static
    address 10.78.2.1
    netmask 255.255.255.0
auto eth3
iface eth3 inet static
    address 10.78.3.1
    netmask 255.255.255.0
EOF
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
/etc/init.d/networking restart
