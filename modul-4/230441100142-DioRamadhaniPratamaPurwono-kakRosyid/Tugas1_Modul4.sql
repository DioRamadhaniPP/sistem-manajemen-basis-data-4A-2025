
-- 1. Kolom keterangan di salah satu tabel pada bagian akhir tabel tersebut!
ALTER TABLE pengunjung ADD keterangan TEXT;

SELECT * FROM pengunjung;

-- 2. Gabungan 2 tabel yang memungkinkan dan memiliki fungsi pada penerapannya!
SELECT r.id_reservasi, p.nama_pengunjung
FROM reservasi r
JOIN pengunjung p ON r.id_pengunjung = p.id_pengunjung;

SELECT r.id_reservasi, p.nama_pengunjung
FROM pengunjung p
JOIN reservasi r ON r.id_reservasi = r.id_reservasi;
-- 3.Urutan kolom pada setiap tabel menggunakan perintah Order By, DESC, dan ASC (minimal 1 untuk setiap perintah)

SELECT * FROM kamar ORDER BY nomor_kamar ASC;

SELECT * FROM pengunjung ORDER BY id_pengunjung DESC;

SELECT * FROM jenis_kamar ORDER BY harga_per_malam;

-- 4.Perubahan pada salah satu tipe data yang dapat berguna
ALTER TABLE pengunjung MODIFY telepon VARCHAR(30);

-- 5.Kode Left Join, Right Join dan Self Join beserta dengan alur prosesnya

SELECT p.nama_pengunjung, r.id_reservasi
FROM pengunjung p
LEFT JOIN reservasi r ON p.id_pengunjung = r.id_pengunjung;

SELECT r.id_reservasi, p.nama_pengunjung
FROM reservasi r
RIGHT JOIN pengunjung p ON r.id_pengunjung = p.id_pengunjung;

SELECT k1.nomor_kamar AS kamar_1, k2.nomor_kamar AS kamar_2, jk.nama_jenis
FROM kamar k1
JOIN kamar k2 ON k1.id_jenis_kamar = k2.id_jenis_kamar AND k1.id_kamar != k2.id_kamar
JOIN jenis_kamar jk ON k1.id_jenis_kamar = jk.id_jenis_kamar;

-- 6.Kode yang mengandung operator perbandingan (Minimal 5)

-- a. Harga kamar lebih dari 500.000
SELECT * FROM jenis_kamar WHERE harga_per_malam > 500000;

-- b. Reservasi dengan jumlah malam sama dengan 3
SELECT * FROM reservasi WHERE jumlah_malam = 3;

-- c. Kamar dengan ID jenis kamar tidak sama dengan 2
SELECT * FROM kamar WHERE id_jenis_kamar != 2;

-- d. Pengunjung dengan ID lebih kecil dari 10
SELECT * FROM pengunjung WHERE id_pengunjung < 10;

-- e. Reservasi yang total harganya lebih kecil atau sama dengan 1 juta
SELECT * FROM reservasi WHERE total_harga <= 1000000;

SELECT 
    p.nama_pengunjung,
    k.nomor_kamar,
    jk.nama_jenis,
    r.tanggal_checkout,
    r.STATUS
FROM reservasi r
JOIN pengunjung p ON r.id_pengunjung = p.id_pengunjung
JOIN kamar k ON r.id_kamar = k.id_kamar
JOIN jenis_kamar jk ON k.id_jenis_kamar = jk.id_jenis_kamar
WHERE 
    r.tanggal_checkout >= '2025-04-01'
    AND r.tanggal_checkout < '2025-05-01'
    AND r.STATUS = 'Selesai';




