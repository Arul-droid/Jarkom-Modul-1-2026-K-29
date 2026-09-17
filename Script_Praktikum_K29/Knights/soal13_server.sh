#!/bin/bash
useradd -m -s /bin/bash mika_admin
echo "mika_admin:rahasia123" | chpasswd
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
/etc/init.d/ssh restart
