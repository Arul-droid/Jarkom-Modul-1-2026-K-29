# Jarkom-Modul-1-2026-K-29
### Ahmad Nayottama Juliansyah - 5027251045 <br> Muhammad Nasrulhaq - 5027251117
---
```
Batas antara Dunia Nyata dan The Wired perlahan mulai runtuh setelah kepergian Chisa Yomoda, yang meninggalkan pesan bahwa dirinya tetap hidup di dalam The Wired. Di balik kekacauan ini berdiri Masami Eiri, mantan perancang Protokol 7 di Laboratorium Tachibana, yang setelah kematian fisiknya berhasil mengunggah kesadarannya ke jaringan dan mendeklarasikan diri sebagai penguasa The Wired, didukung kelompok peretas Knights of the Eastern Calculus.
Di tengah kekacauan ini, Lain Iwakura menyadari eksistensi sejatinya sebagai entitas pengendali The Wired. Untuk menjaga stabilitas komunikasi serta melindungi sahabatnya Alice Mizuki dan kakaknya Mika Iwakura dari campur tangan Eiri, Lain bertindak sebagai Router untuk membangun sendiri arsitektur jaringan The Wired yang aman.
```
#### 1. Untuk mempersiapkan pembangunan The Wired, Lain yang berperan sebagai Router membuat tiga Switch/Gateway: Switch 1 menuju dua Entitas yaitu Alice dan Mika, Switch 2 menuju Chisa, sedangkan Switch 3 menuju Knights dan Eiri. Kelima Entitas tersebut dikonfigurasi sebagai Client di GNS3.

<img src="resources/soal1.png">

---

#### 2. Karena menurut Lain pada saat itu The Wired masih terisolasi dari dunia luar, konfigurasikan router Lain agar dapat tersambung langsung ke jaringan internet publik melalui NAT/DHCP pada interface eth0.
Konfigurasi router agar tersambung langsung ke jaringan internet publik:
```
# Jalur Internet (menuju NAT1)
auto eth0
iface eth0 inet dhcp
    up sysctl -w net.ipv4.ip_forward=1
    up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```

```
# Jalur ke Subnet-1 (Alice & Mika)
auto eth1
iface eth1 inet static
    address 10.78.1.1
    netmask 255.255.255.0
```
```
# Jalur ke Subnet-2 (Chisa)
auto eth2
iface eth2 inet static
    address 10.78.2.1
    netmask 255.255.255.0
```
```
# Jalur ke Subnet-3 (Knights & Eiri)
auto eth3
iface eth3 inet static
    address 10.78.3.1
    netmask 255.255.255.0
```


#### 3. Setelah router Lain terhubung ke internet, pastikan seluruh Entitas (Client) di bawah Switch 1, Switch 2, dan Switch 3 dapat saling terhubung dan berkomunikasi satu sama lain melalui konfigurasi routing.
Dengan configure router:
```
eth1 (Subnet Alice & Mika): 10.78.1.1
eth2 (Subnet Chisa): 10.78.2.1
eth3 (Subnet Knights & Eiri): 10.78.3.1
```
```
IP Alice: 10.78.1.2, Gateway 10.78.1.1
IP Mika:  10.78.1.3, Gateway 10.78.1.1
IP Chisa: 10.78.2.2 Gateway 10.78.2.1
IP Knights: 10.78.3.2 Gateway 10.78.3.1
IP Eiri: 10.78.3.3 Gateway 10.78.3.1
```
Jalankan perintah: ``` ping -c 2 10.78.x.x ``` untuk mengecek apakah client satu sama ain sudah dapat terhubung. 

Berikut melalui client1 (Alice) dengan menjalankan perintah: ``` ping -c 2 10.78.3.2 ``` (Knights) 

<img src="resources/soal3.png">


#### 4. Lain ingin agar setiap Entitas (Client) memiliki kemandirian di The Wired. Konfigurasikan firewall/iptables (NAT Masquerade) dan DNS resolver agar setiap Client dapat terhubung ke internet secara mandiri (dapat melakukan ping ke 8.8.8.8 dan membuka domain web google.com).
```
sysctl -w net.ipv4.ip_forward=1
```
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
```


#### 5. Eiri tetap berupaya menanamkan kekacauan ke dalam jaringan. Untuk mengantisipasi restart tiba-tiba, pastikan seluruh konfigurasi jaringan tidak hilang saat semua node di-restart. Buat script verifikasi di /root/cek_status.sh pada router Lain yang menampilkan ringkasan interface (ip -br a) dan status tabel NAT (iptables -t nat -L -v -n) setelah reboot.
Membuat shell script cek_status.sh dengan shell code:
```
echo "=================================================="
echo "1. STATUS INTERFACE & IP ADDRESS (ip -br a)"
echo "=================================================="
ip -br a

echo ""
echo "=================================================="
echo "2. STATUS RULE IPTABLES NAT (iptables -t nat -L -v -n)"
echo "=================================================="
iptables -t nat -L -v -n
echo "=================================================="
```

<img src="resources/soal5.png">

Seluruh konfigurasi interface (eth0, eth1, eth2, eth3) dan NAT Masquerade pada eth0 berhasil tersimpan secara permanen di router Lain dan otomatis dimuat ulang saat reboot.

Script /root/cek_status.sh berhasil mengeksekusi pemeriksaan jaringan dengan menampilkan ringkasan IP address per interface serta rule tabel NAT iptables secara lengkap dan valid.

#### 6. Mika mencurigai adanya anomali traffic pada segmen jaringannya. Jalankan generator traffic berikut (link file) pada node Mika, lalu lakukan packet sniffing menggunakan Wireshark pada interface node Mika. Terapkan display filter khusus untuk menyaring paket yang berprotokol DNS atau ICMP. Tunjukkan screenshot hasil filter beserta ringkasan paket yang lolos.
Dokumentasi hasil filter besertakan ringkasan paket yang lolos:
<img src="resources/soal64.png">
<img src="resources/soal6dns.png">
<img src="resources/soal6icmp.png">


#### 7. Chisa memutuskan mendirikan FTP Server pada node miliknya dengan shared folder di /var/wired/data. Terapkan kebijakan akses: user alice (hak akses read & write), user mika (dibatasi read-only), dan user eiri (dibatasi tanpa izin akses / blacklist). Buktikan konfigurasi dengan membuat file signal_alice.txt dari user alice, dan buktikan penolakan akses saat user eiri mencoba login.

```
apt update && apt install -y vsftpd nano 
nano /etc/vsftpd.conf 
sftpd start atau /usr/sbin/vsftpd & 
```
```
mkdir -p /var/wired/data
chmod 777 /var/wired/data

useradd -m -s /bin/bash alice
useradd -m -s /bin/bash mika
useradd -m -s /bin/bash eiri

echo "alice:123" | chpasswd
echo "mika:123" | chpasswd
echo "eiri:123" | chpasswd

cat /etc/passwd | grep -E "alice|mika|eiri" 

nano /etc/vsftpd.conf

Pastikan baris-baris berikut tidak memiliki tanda pagar (#) dan nilainya sesuai (tambahkan di baris paling bawah jika tidak ada): 
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_root=/var/wired/data

# Konfigurasi Blacklist & Hak Akses Spesifik
userlist_enable=YES
userlist_deny=YES
userlist_file=/etc/vsftpd.userlist
user_config_dir=/etc/vsftpd_user_conf

echo "eiri" > /etc/vsftpd.userlist

cat /etc/vsftpd.userlist 

mkdir -p /etc/vsftpd_user_conf
echo "write_enable=NO" > /etc/vsftpd_user_conf/mika

cat /etc/vsftpd_user_conf/mika 

```

#### 8. Kelompok rahasia Knights perlu mengirimkan dokumen laporan intelijen ke FTP Server Chisa. Lakukan koneksi FTP client dari node Knights ke FTP Server Chisa menggunakan akun alice. Upload file berikut (link file). Analisis sesi Wireshark dan sebutkan: perintah FTP untuk upload (STOR), kode status sukses server (226), dan port data TCP yang dinegosiasikan pada mode PASV.

#### 9. 
#### 10.  
#### 11.  
#### 12.  
#### 13.  
#### 14.  
#### 15.  
#### 16.  
#### 17.  
#### 18.  
#### 19. 
#### 20. 