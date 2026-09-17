#!/bin/bash
cat << 'EOF' > /etc/network/interfaces
auto eth0
iface eth0 inet static
    address 10.78.1.2
    netmask 255.255.255.0
    gateway 10.78.1.1
EOF
echo "nameserver 8.8.8.8" > /etc/resolv.conf
/etc/init.d/networking restart
