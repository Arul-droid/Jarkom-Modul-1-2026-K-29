#!/bin/bash
apt -o Acquire::ForceIPv4=true update
apt -o Acquire::ForceIPv4=true install -y openssh-server apache2
/etc/init.d/ssh start
/etc/init.d/apache2 start
