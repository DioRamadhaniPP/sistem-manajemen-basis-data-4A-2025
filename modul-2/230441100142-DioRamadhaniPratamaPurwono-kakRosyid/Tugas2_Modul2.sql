#NO1 
CREATE VIEW v_reservasi_pengunjung AS
SELECT 
    r.id_reservasi,
    p.nama_pengunjung,
    p.no_identitas,
    p.telepon,
    p.email,
    r.tanggal_checkin,
    r.tanggal_checkout,
    r.jumlah_malam,
    r.total_harga,
    r.STATUS AS status_reservasi
FROM reservasi r
JOIN pengunjung p ON r.id_pengunjung = p.id_pengunjung;
    
SELECT * FROM v_reservasi_pengunjung;

#NO2

CREATE VIEW view_riwayat_reservasi AS
SELECT 
    lr.id_log,
    r.id_reservasi,
    p.nama_pengunjung,
    k.nomor_kamar,
    lr.status AS status_log,
    lr.waktu_update,
    lr.keterangan
FROM log_reservasi lr
JOIN reservasi r ON lr.id_reservasi = r.id_reservasi
JOIN pengunjung p ON r.id_pengunjung = p.id_pengunjung
JOIN kamar k ON r.id_kamar = k.id_kamar;


SELECT * FROM view_riwayat_reservasi;

#NO3
CREATE VIEW v_kamar_tersedia AS
SELECT
    k.id_kamar,
    k.nomor_kamar,
    j.nama_jenis   AS tipe_kamar,
    j.harga_per_malam
FROM kamar k
JOIN jenis_kamar j ON k.id_jenis_kamar = j.id_jenis_kamar
WHERE k.STATUS = 'Tersedia';

SELECT * FROM v_kamar_tersedia;

#NO4

CREATE VIEW view_statistik_jenis_kamar AS
SELECT 
    jk.nama_jenis AS jenis_kamar,
    COUNT(r.id_reservasi) AS jumlah_reservasi,
    SUM(r.total_harga) AS total_pemasukan,
    AVG(r.total_harga) AS rata_rata_pemasukan,
    MIN(r.total_harga) AS pemasukan_terendah,
    MAX(r.total_harga) AS pemasukan_tertinggi
FROM 
    reservasi r
JOIN kamar k ON r.id_kamar = k.id_kamar
JOIN jenis_kamar jk ON k.id_jenis_kamar = jk.id_jenis_kamar
GROUP BY jk.nama_jenis;
    
SELECT * FROM view_statistik_jenis_kamar;

#NO5

CREATE VIEW view_detail_reservasi_aktif AS
SELECT 
    r.id_reservasi,
    p.nama_pengunjung,
    p.no_identitas,
    p.telepon,
    k.nomor_kamar,
    jk.nama_jenis AS jenis_kamar,
    r.tanggal_checkin,
    r.tanggal_checkout,
    r.jumlah_malam,
    r.total_harga,
    r.STATUS AS status_reservasi
FROM reservasi r
JOIN pengunjung p ON r.id_pengunjung = p.id_pengunjung
JOIN kamar k ON r.id_kamar = k.id_kamar
JOIN jenis_kamar jk ON k.id_jenis_kamar = jk.id_jenis_kamar
WHERE r.STATUS IN ('Dipesan', 'Check-in');

SELECT * FROM view_detail_reservasi_aktif;


DROP VIEW v_detail_reservasi;








