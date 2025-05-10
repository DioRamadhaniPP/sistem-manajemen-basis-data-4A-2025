#NO1

DELIMITER //

CREATE PROCEDURE UpdateDataMaster (
    IN p_id INT,
    IN p_nilai_baru VARCHAR(100),
    OUT p_status VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        SET p_status = 'Gagal';
    END;

    UPDATE pengunjung
    SET nama_pengunjung = p_nilai_baru
    WHERE id_pengunjung = p_id;

    SET p_status = 'Berhasil';
END //

DELIMITER ;

SET @status = 'Berhasil';

CALL UpdateDataMaster(1, 'DoditttSimatupang', @status);

SELECT @status;

SELECT nama_pengunjung FROM pengunjung;

#NO2
DELIMITER //

CREATE PROCEDURE CountTransaksi (
    OUT total_transaksi INT
)
BEGIN
    SELECT COUNT(*) INTO total_transaksi FROM reservasi;
END //

DELIMITER ;

-- Buat variabel untuk OUT
SET @total = ;

-- Panggil prosedur
CALL CountTransaksi(@total);

-- Tampilkan hasilnya
SELECT @total AS jumlah_transaksi;


#NO3
DELIMITER //

CREATE PROCEDURE GetDataMasterByID (
    IN p_id INT,
    OUT p_nama VARCHAR(100),
    OUT p_no_identitas VARCHAR(50),
    OUT p_telepon VARCHAR(20)
)
BEGIN
    SELECT nama_pengunjung, no_identitas, telepon
    INTO p_nama, p_no_identitas, p_telepon
    FROM pengunjung
    WHERE id_pengunjung = p_id;
END //

DELIMITER ;

-- Panggil prosedur
CALL GetDataMasterByID(3, @nama, @no_identitas, @telepon);

-- Tampilkan hasil
SELECT @nama AS nama, @no_identitas AS no_identitas, @telepon AS telepon;


#NO4
DELIMITER //

CREATE PROCEDURE UpdateFieldTransaksi (
    IN p_id INT,
    INOUT p_jumlah_malam INT,
    INOUT p_total_harga DECIMAL(10,2)
)
BEGIN
    DECLARE v_jumlah_malam INT;
    DECLARE v_total_harga DECIMAL(10,2);

    SELECT jumlah_malam, total_harga
    INTO v_jumlah_malam, v_total_harga
    FROM reservasi
    WHERE id_reservasi = p_id;

    IF p_jumlah_malam IS NULL THEN
        SET p_jumlah_malam = v_jumlah_malam;
    END IF;

    IF p_total_harga IS NULL THEN
        SET p_total_harga = v_total_harga;
    END IF;

    UPDATE reservasi
    SET jumlah_malam = p_jumlah_malam,
        total_harga = p_total_harga
    WHERE id_reservasi = p_id;
END //

DELIMITER ;

-- Set nilai awal
SET @jumlah_malam = 4;
SET @total_harga = 12000000.00;

-- Panggil prosedur
CALL UpdateFieldTransaksi(3, @jumlah_malam, @total_harga);

SELECT * FROM reservasi WHERE id_reservasi = 1;



#NO5
DELIMITER //

CREATE PROCEDURE DeleteEntriesByIDMaster (
    IN p_id INT
)
BEGIN
    DELETE FROM pengunjung WHERE id_pengunjung = p_id;
END //

DELIMITER ;

CALL DeleteEntriesByIDMaster(12);

SELECT * FROM pengunjung;


