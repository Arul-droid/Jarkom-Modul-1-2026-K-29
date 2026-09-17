#!/bin/bash
apt -o Acquire::ForceIPv4=true install -y telnetd inetutils-inetd
useradd -m -s /bin/bash phantom_user
echo "phantom_user:wired_ghost" | chpasswd
echo "telnet stream tcp nowait root /usr/sbin/telnetd" > /etc/inetd.conf
/etc/init.d/inetutils-inetd restart
