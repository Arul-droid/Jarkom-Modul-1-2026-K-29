#!/bin/bash
apt -o Acquire::ForceIPv4=true update
apt -o Acquire::ForceIPv4=true install -y vsftpd nano
mkdir -p /var/wired/data
chmod 777 /var/wired/data
useradd -m -s /bin/bash alice
useradd -m -s /bin/bash mika
useradd -m -s /bin/bash eiri
echo "alice:123" | chpasswd
echo "mika:123" | chpasswd
echo "eiri:123" | chpasswd
cat << 'EOF' >> /etc/vsftpd.conf
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_root=/var/wired/data
userlist_enable=YES
userlist_deny=YES
userlist_file=/etc/vsftpd.userlist
user_config_dir=/etc/vsftpd_user_conf
EOF
echo "eiri" > /etc/vsftpd.userlist
mkdir -p /etc/vsftpd_user_conf
echo "write_enable=NO" > /etc/vsftpd_user_conf/mika
killall vsftpd
/usr/sbin/vsftpd &
