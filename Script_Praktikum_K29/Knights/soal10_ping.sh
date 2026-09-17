#!/bin/bash
echo "Mulai mengirim 77 paket ping ke Chisa (10.78.2.2)..."
echo "Pastikan Wireshark sudah menyala di kabel!"
ping -c 77 -s 128 -i 0.3 10.78.2.2
echo "Pengujian selesai."
