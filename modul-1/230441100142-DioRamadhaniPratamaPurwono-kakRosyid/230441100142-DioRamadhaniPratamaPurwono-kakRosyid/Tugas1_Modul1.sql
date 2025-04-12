CREATE DATABASE dbakademik;
USE dbakademik;

CREATE TABLE mahasiswa (
    id_mahasiswa INT (20) NOT NULL PRIMARY KEY,
    nama VARCHAR(100),
    nim VARCHAR(15),
    jurusan VARCHAR(50)
);

CREATE TABLE dosen (
    id_dosen INT (20) NOT NULL PRIMARY KEY,
    nama VARCHAR(100),
    nip VARCHAR(20),
    bidang_keahlian VARCHAR(50)
);

CREATE TABLE mataKuliah (
    id_matkul INT (11) NOT NULL PRIMARY KEY,
    nama_matkul VARCHAR(100),
    sks INT,
    id_dosen INT,
    FOREIGN KEY (id_dosen) REFERENCES dosen(id_dosen)
);

CREATE TABLE krs (
    id_krs INT (3) NOT NULL PRIMARY KEY,
    id_mahasiswa INT,
    id_matkul INT,
    semester INT,
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_matkul) REFERENCES mataKuliah(id_matkul)
);

CREATE TABLE asdos (
id_asdos INT (3) NOT NULL PRIMARY KEY,
nama_asdos VARCHAR (25),
id_mahasiswa INT,
id_dosen INT,
FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
FOREIGN KEY (id_dosen) REFERENCES dosen(id_dosen)
);

INSERT INTO asdos (id_asdos, nama_asdos, id_mahasiswa, id_dosen) VALUES
(1, 'Kak rosyid', 1, 7),
(2, 'Kak rosyid', 2, 7);

SELECT * FROM asdos;

#Isi data pada tabel masing – masing 10 data untuk table Mahasiswa, Dosen dan Matakuliah

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `nim`, `jurusan`) VALUES
(1, 'CYNDIFANITA BTHARI MARSHA', '230441100109', 'SISTEM INFORMASI'),
(2, 'ALVYAN MAULANA KARNAWAN PUTRA', '230441100120', 'SISTEM INFORMASI'),
(3, 'ADZIKRY DEVEGA MAHARITZA AISY', '230441100128', 'SISTEM INFORMASI'),
(4, 'MUHAMMAD RIFKY AWALUDIN', '230441100134', 'SISTEM INFORMASI'),
(5, 'NURUL HASANAH', '230441100136', 'SISTEM INFORMASI'),
(6, 'DIO RAMADHANI PRATAMA PURWONO', '230441100142', 'SISTEM INFORMASI'),
(7, 'DEBBIE ARDIYANTI LEGITA', '230441100143', 'SISTEM INFORMASI'),
(8, 'AGATHA YASMIN RAHMAN', '230441100156', 'SISTEM INFORMASI'),
(9, 'AKHMED SULTAN RASULAN', '230441100168', 'SISTEM INFORMASI'),
(10, 'MUHAMMAD FAJRI ALFAINI', '230441100171', 'SISTEM INFORMASI'),
(11, 'TAUFIK IKROM JAMIL', '230441100179', 'SISTEM INFORMASI');

INSERT INTO `dosen` (`id_dosen`, `nama_dosen`, `nip`, `bidang_keahlian`) VALUES
(1, 'Dr.WAHYUDI SETIAWAN, S.Kom., M.Kom.', 'D1001', 'DATA MINING'),
(2, 'Mashudah Sabilaturrizqi, S.Kom., M.Kom.', 'D1002', 'FINANCIAL TECHNOLOGY'),
(3, 'WAHYUDI AGUSTIONO, S.Kom., M.Sc, Ph.D.', 'D1003', 'IMPLEMENTASI DAN PENGUJIAN PERANGKAT LUNAK'),
(4, 'NOVI PRASTITI, S.Kom, M.Kom', 'D1004', 'MANAJEMEN PROYEK IT'),
(5, 'S.KomIMAMAH, M.Kom', 'D1005', 'PEMROGRAMAN BERGERAK'),
(6, 'YENI KUSTIYAHNINGSIH, S.Kom., M.Kom.', 'D1006', 'PERENCANAAN SUMBER DAYA PERUSAHAAN'),
(7, 'MOHAMMAD SYARIEF, ST., M.Cs', 'D1007', 'SISTEM MANAJEMEN BASIS DATA'),
(8, 'SRI HERAWATI, S.Kom, M.Kom', 'D1008', 'SISTEM PENDUKUNG KEPUTUSAN'),
(9, 'DONI ABDUL FATAH, S.Kom., M.Kom.', 'D1009', 'CAPSTONE PROJECT'),
(10, 'MUHAMMAD YUSUF, ST, M.MT.', 'D1010', 'E-GOVERNMENT');

INSERT INTO `matakuliah` (`id_matkul`, `nama_matkul`, `sks`, `id_dosen`) VALUES
(1, 'DATA MINING', 3, 1),
(2, 'FINANCIAL TECHNOLOGY', 3, 2),
(3, 'IMPLEMENTASI DAN PENGUJIAN PERANGKAT LUNAK', 3, 3),
(4, 'MANAJEMEN PROYEK IT', 3, 4),
(5, 'PEMROGRAMAN BERGERAK', 4, 5),
(6, 'PERENCANAAN SUMBER DAYA PERUSAHAAN', 3, 6),
(7, 'SISTEM MANAJEMEN BASIS DATA', 4, 7),
(8, 'SISTEM PENDUKUNG KEPUTUSAN', 3, 8),
(9, 'CAPSTONE PROJECT', 3, 9),
(10, 'E-GOVERNMENT', 3, 10);

#Tampilkan keseluruhan data pada setiap tabel.

SELECT * FROM mahasiswa;
SELECT * FROM dosen;
SELECT * FROM matakuliah;
SELECT * FROM krs;

#Tambahkan data pada tabel KRS sebanyak 5 data.

INSERT INTO `krs` (`id_krs`, `id_mahasiswa`, `id_matkul`, `semester`) VALUES
(1, 1, 1, 4),
(2, 2, 2, 4),
(3, 3, 3, 4),
(4, 4, 4, 4),
(5, 5, 5, 4);

#Lakukan perubahan pada salah satu nama tabel

UPDATE mahasiswa SET nama = 'AHMAD RIKHAN ARBAI' , nim = '230441100192' WHERE id_mahasiswa = 11 ;

#Hapus database tersebut.

DROP DATABASE dbakademik;


