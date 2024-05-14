Ini merupakan sebuah simulasi sederhana untuk membuat simulasi jaringan wired menggunakan NS-2
NS-2 dibangun dari 2 bahasa pemrograman: library-library dengan Bahasa pemrograman C++ yang digunakan untuk event scheduler, protocol dan network components, dan Tcl/OTcl yang merupakan Bahasa pemrograman untuk menulis script simulasi. Hubungan antara input simulasi, proses eksekusi dan output simulasi dengan kedua Bahasa pemrograman tersebut di atas ditunjukkan sebagai batang tubuh NS-2

![image](https://github.com/ramizass/ns2wirednetworksim/assets/88464165/aa01af61-05c8-4793-ba9d-e47f350a55e6)

**Komponen-komponen NS-2**
1. NS sebagai simulator
2. NAM, sebagai network animator bertugas untuk mem-visualisasikan output dari NS-2.
Editor NAM berupa interface GUI yang dipanggil sebagai file ber-ekstensi .nam pada
script Tcl.
3. Pre-processing, bertugas membangkitkan trafik dan topologi jaringan
4. Post-processing, berupa analisa hasil simulasi yang ditampilkan pada file .tr dimana
sebagian dari hasl simulasi tersebut dapat di-filter menggunakan perintah awk dan dapat
dikonversikan dalam bentuk grafik dengan tool XGraph. Penjelasan untuk pem-filter an
data simulasi ini secara detail ada di bagian akhir petunjuk praktikum.

**Langkah-langkah dalam Membangun Simulasi dengan NS-2**
1. Buat simulator object dan event scheduler menggunakan tcl programming
2. Buat topologi jaringan
3. Definisikan pola trafik
4. Definisikan trace file
5. Atur jalannya scenario simulasi, traffic flow, trace dan event-event lainnya.
6. Olah data hasil trace file menjadi data yang siap di-plot dan untuk memudahkan analisa

**Skenario Simulasi**
Skenario simulasi yang akan dibangun dengan penjelasan sebagai berikut:
1. Sebuah jaringan wired terdiri dari 4 node (n0, n1, n2 dan n3).
2. Jalur antara n0 dan n2 adalah duplex dengan bandwidth 100 Mbps, delay 5 ms dan queue tipe DropTail.
3. Hal yang sama berlaku untuk jalur dari n1 ke n2.
4. Di antara n2 dan n4 dibangun jalur duplex dengan bandwidth 54 Mbps delay 10 ms dan DropTail queue, begitu pula dari n2 dan n3.
5. Sementara itu di antara n3 dan n4 ada jalur simplex dengan bandwidth 10 Mbps dan delay 15 ms.
6. Akan dialirkan paket aplikasi CBR dari node n0 ke n3 yang melalui protokol UDP dengan node n3 adalah Null agent.
7. Sementara paket FTP dialirkan dari node n1 ke n4 melalui protocol TCP, dengan node n4 adalah TCPSink.
8. Simulasi dijalankan selama 6 detik. Pada detik ke 0,5 paket ftp mulai dikirimkan dan berakhir pada detik ke 4,5.
9. Pada detik ke 2 paket cbr dikirimkan dan berakhir pada detik ke 5.

![image](https://github.com/ramizass/ns2wirednetworksim/assets/88464165/ba572aaa-6b82-4e38-b3d3-dbf3a9a16187)
