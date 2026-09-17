#!/bin/bash
useradd -m -s /bin/bash mika_admin
echo "User mika_admin dibuat. Harap eksekusi perintah berikut secara manual:"
echo "1. su - mika_admin"
echo "2. ssh-keygen -t rsa -b 2048"
echo "3. ssh-copy-id mika_admin@10.78.3.2"
