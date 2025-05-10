CREATE DATABASE umkm_jawa_barat;
USE umkm_jawa_barat;

CREATE TABLE kabupaten_kota (
    id_kabupaten_kota INT AUTO_INCREMENT PRIMARY KEY,
    nama_kabupaten_kota VARCHAR(100)
);

CREATE TABLE skala_umkm (
    id_skala INT AUTO_INCREMENT PRIMARY KEY,
    nama_skala VARCHAR(50),
    batas_aset_bawah DECIMAL(15,2),
    batas_aset_atas DECIMAL(15,2),
    batas_omzet_bawah DECIMAL(15,2),
    batas_omzet_atas DECIMAL(15,2)
);

CREATE TABLE kategori_umkm (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100),
    deskripsi TEXT
);

CREATE TABLE pemilik_umkm (
    id_pemilik INT AUTO_INCREMENT PRIMARY KEY,
    nik VARCHAR(60) UNIQUE,
    nama_lengkap VARCHAR(100),
    jenis_kelamin ENUM('Laki-Laki', 'Perempuan'),
    alamat TEXT,
    nomor_telepon VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE umkm (
    id_umkm INT AUTO_INCREMENT PRIMARY KEY,
    nama_usaha VARCHAR(200),
    id_pemilik INT,
    id_kategori INT,
    id_skala INT,
    id_kabupaten_kota INT,
    alamat_usaha TEXT,
    nib VARCHAR (50),
    npwp VARCHAR (20),
    tahun_berdiri YEAR (4),
    jumlah_karyawan INT (11),
    total_aset DECIMAL(15,2),
    omzet_per_tahun DECIMAL(15,2),
    deskripsi_usaha TEXT,
    tanggal_registrasi DATE,
    FOREIGN KEY (id_pemilik) REFERENCES pemilik_umkm(id_pemilik),
    FOREIGN KEY (id_kategori) REFERENCES kategori_umkm(id_kategori),
    FOREIGN KEY (id_skala) REFERENCES skala_umkm(id_skala),
    FOREIGN KEY (id_kabupaten_kota) REFERENCES kabupaten_kota(id_kabupaten_kota)
);

CREATE TABLE produk_umkm (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    id_umkm INT,
    nama_produk VARCHAR(200),
    deskripsi_produk TEXT,
    harga DECIMAL(15,2),
    FOREIGN KEY (id_umkm) REFERENCES umkm(id_umkm)
);

#NO1
DELIMITER //

CREATE PROCEDURE AddUMKM (
    IN p_nama_usaha VARCHAR(200),
    IN p_jumlah_karyawan INT
)
BEGIN
    INSERT INTO umkm (
        nama_usaha,
        jumlah_karyawan,
        tanggal_registrasi
    ) VALUES (
        p_nama_usaha,
        p_jumlah_karyawan,
        CURDATE() -- isi tanggal registrasi otomatis dengan tanggal hari ini
    );
END //

DELIMITER ;

CALL AddUMKM('Bebek Carok', 10);
SELECT nama_usaha, jumlah_karyawan FROM umkm;

#NO2
DELIMITER //

CREATE PROCEDURE UpdateKategoriUMKM (
    IN p_id_kategori INT,
    IN p_nama_baru VARCHAR(100)
)
BEGIN
    UPDATE kategori_umkm
    SET nama_kategori = p_nama_baru
    WHERE id_kategori = p_id_kategori;
END //

DELIMITER ;

CALL UpdateKategoriUMKM(3, 'Transportasi');

SELECT id_kategori, nama_kategori FROM kategori_umkm;

#NO3
DELIMITER //

CREATE PROCEDURE DeletePemilikUMKM (
    IN p_id_pemilik INT
)
BEGIN
    DELETE FROM pemilik_umkm
    WHERE id_pemilik = p_id_pemilik;
END //

DELIMITER ;

CALL DeletePemilikUMKM(15);

SELECT * FROM pemilik_umkm;

#NO4
DELIMITER //

CREATE PROCEDURE AddProduk (
    IN p_id_umkm INT,
    IN p_nama_produk VARCHAR(200),
    IN p_harga DECIMAL(15,2)
)
BEGIN
    INSERT INTO produk_umkm (
        id_umkm,
        nama_produk,
        harga
    ) VALUES (
        p_id_umkm,
        p_nama_produk,
        p_harga
    );
END //

DELIMITER ;

CALL AddProduk(2, 'Kopi Arabika Premium', 75000.00);

SELECT * FROM produk_umkm;

CALL DeleteProduk(1);

#NO 5
DELIMITER //

CREATE PROCEDURE GetUMKMByID (
    IN p_id_umkm INT,
    OUT p_nama_usaha VARCHAR(200),
    OUT p_jumlah_karyawan INT,
    OUT p_tahun_berdiri YEAR
)
BEGIN
    SELECT 
        nama_usaha, 
        jumlah_karyawan, 
        tahun_berdiri
    INTO 
        p_nama_usaha, 
        p_jumlah_karyawan, 
        p_tahun_berdiri
    FROM umkm
    WHERE id_umkm = p_id_umkm;
END //

DELIMITER ;

-- Siapkan variabel untuk output
SET @nama := 'Pentol Ghepek';
SET @karyawan := 2;
SET @tahun := 2025;

-- Panggil stored procedure
CALL GetUMKMByID(2, @nama, @karyawan, @tahun);

-- Tampilkan hasil
SELECT @nama AS nama_usaha, @karyawan AS jumlah_karyawan, @tahun AS tahun_berdiri;

SELECT * FROM umkm;



