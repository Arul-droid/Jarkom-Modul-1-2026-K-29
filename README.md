# Jarkom-Modul-1-2026-K-29
### Ahmad Nayottama Juliansyah - 5027251045 <br> Muhammad Nasrulhaq - 5027251117
---
```
Batas antara Dunia Nyata dan The Wired perlahan mulai runtuh setelah kepergian Chisa Yomoda, yang meninggalkan pesan bahwa dirinya tetap hidup di dalam The Wired. Di balik kekacauan ini berdiri Masami Eiri, mantan perancang Protokol 7 di Laboratorium Tachibana, yang setelah kematian fisiknya berhasil mengunggah kesadarannya ke jaringan dan mendeklarasikan diri sebagai penguasa The Wired, didukung kelompok peretas Knights of the Eastern Calculus.
Di tengah kekacauan ini, Lain Iwakura menyadari eksistensi sejatinya sebagai entitas pengendali The Wired. Untuk menjaga stabilitas komunikasi serta melindungi sahabatnya Alice Mizuki dan kakaknya Mika Iwakura dari campur tangan Eiri, Lain bertindak sebagai Router untuk membangun sendiri arsitektur jaringan The Wired yang aman.
```
#### 1. Untuk mempersiapkan pembangunan The Wired, Lain yang berperan sebagai Router membuat tiga Switch/Gateway: Switch 1 menuju dua Entitas yaitu Alice dan Mika, Switch 2 menuju Chisa, sedangkan Switch 3 menuju Knights dan Eiri. Kelima Entitas tersebut dikonfigurasi sebagai Client di GNS3.
blablabla

---

#### 2. Karena menurut Lain pada saat itu The Wired masih terisolasi dari dunia luar, konfigurasikan router Lain agar dapat tersambung langsung ke jaringan internet publik melalui NAT/DHCP pada interface eth0.

#### 3. Setelah router Lain terhubung ke internet, pastikan seluruh Entitas (Client) di bawah Switch 1, Switch 2, dan Switch 3 dapat saling terhubung dan berkomunikasi satu sama lain melalui konfigurasi routing.

#### 4. Lain ingin agar setiap Entitas (Client) memiliki kemandirian di The Wired. Konfigurasikan firewall/iptables (NAT Masquerade) dan DNS resolver agar setiap Client dapat terhubung ke internet secara mandiri (dapat melakukan ping ke 8.8.8.8 dan membuka domain web google.com).

#### 5. Eiri tetap berupaya menanamkan kekacauan ke dalam jaringan. Untuk mengantisipasi restart tiba-tiba, pastikan seluruh konfigurasi jaringan tidak hilang saat semua node di-restart. Buat script verifikasi di /root/cek_status.sh pada router Lain yang menampilkan ringkasan interface (ip -br a) dan status tabel NAT (iptables -t nat -L -v -n) setelah reboot.

#### 6. Mika mencurigai adanya anomali traffic pada segmen jaringannya. Jalankan generator traffic berikut (link file) pada node Mika, lalu lakukan packet sniffing menggunakan Wireshark pada interface node Mika. Terapkan display filter khusus untuk menyaring paket yang berprotokol DNS atau ICMP. Tunjukkan screenshot hasil filter beserta ringkasan paket yang lolos.

#### 7. Chisa memutuskan mendirikan FTP Server pada node miliknya dengan shared folder di /var/wired/data. Terapkan kebijakan akses: user alice (hak akses read & write), user mika (dibatasi read-only), dan user eiri (dibatasi tanpa izin akses / blacklist). Buktikan konfigurasi dengan membuat file signal_alice.txt dari user alice, dan buktikan penolakan akses saat user eiri mencoba login.

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