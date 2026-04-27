-- FILE SQL LENGKAP

-- 1. Buat database baru --
CREATE DATABASE perpustakaan_lengkap;

-- 2. CREATE TABLE semua tabel --
-- TABEL 1: kategori_buku
CREATE TABLE kategori_buku (
    id_kategori   INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(50)  NOT NULL UNIQUE,
    deskripsi     TEXT,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABEL 2: penerbit
CREATE TABLE penerbit (
    id_penerbit   INT AUTO_INCREMENT PRIMARY KEY,
    nama_penerbit VARCHAR(100) NOT NULL,
    alamat        TEXT,
    telepon       VARCHAR(15),
    email         VARCHAR(100),
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABEL 3: buku (didalam sini dapat menyimpan data buku dengan relasi ke tabel kategori_buku dan penerbit)
CREATE TABLE buku (
    id_buku     INT AUTO_INCREMENT PRIMARY KEY,
    kode_buku   VARCHAR(20)  NOT NULL UNIQUE,
    judul       VARCHAR(200) NOT NULL,
    pengarang   VARCHAR(100) NOT NULL,
    tahun       YEAR         NOT NULL,
    harga       DECIMAL(10,2) NOT NULL,
    stok        INT          NOT NULL DEFAULT 0,
    deskripsi   TEXT,
    id_kategori INT          NOT NULL,
    id_penerbit INT          NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Foreign Key ke tabel kategori_buku
    CONSTRAINT fk_kategori
        FOREIGN KEY (id_kategori)
        REFERENCES kategori_buku(id_kategori)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    -- Foreign Key ke tabel penerbit
    CONSTRAINT fk_penerbit
        FOREIGN KEY (id_penerbit)
        REFERENCES penerbit(id_penerbit)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- 3. INSERT DATA SAMPLE --
-- INSERT DATA: kategori_buku

INSERT INTO kategori_buku (nama_kategori, deskripsi) VALUES
('Programming',  'Buku-buku tentang pemrograman dan pengembangan software'),
('Database',     'Buku-buku tentang basis data dan manajemen data'),
('Web Design',   'Buku-buku tentang desain dan pengembangan web'),
('Networking',   'Buku-buku tentang jaringan komputer dan keamanan'),
('Mobile Dev',   'Buku-buku tentang pengembangan aplikasi mobile');

-- INSERT DATA: penerbit
INSERT INTO penerbit (nama_penerbit, alamat, telepon, email) VALUES
('Informatika',    'Jl. Purnawarman No.25, Bandung',          '022-2038040',  'info@informatika.co.id'),
('Elex Media',     'Jl. Palmerah Barat No.29, Jakarta',       '021-5365966',  'info@elexmedia.co.id'),
('Gramedia',       'Jl. Palmerah Selatan No.22, Jakarta',     '021-5365655',  'info@gramedia.co.id'),
('Andi Publisher', 'Jl. Beo No.38, Yogyakarta',              '0274-561881',  'info@andipublisher.co.id'),
('Graha Ilmu',     'Jl. Raya Jombor No.9, Yogyakarta',       '0274-884616',  'info@grahailmu.co.id');

-- INSERT DATA: buku
-- 15 buku dengan relasi yang benar
-- id_kategori: 1=Programming, 2=Database,
--              3=Web Design, 4=Networking, 5=Mobile Dev
-- id_penerbit: 1=Informatika, 2=Elex Media,
--              3=Gramedia, 4=Andi Publisher, 5=Grah Ilmu
INSERT INTO buku (kode_buku, judul, pengarang, tahun, harga, stok, deskripsi, id_kategori, id_penerbit) VALUES
('BK-001', 'Pemrograman PHP untuk Pemula',      'Budi Raharjo',  2023, 75000,  10, 'Panduan lengkap belajar PHP dari nol',              1, 1),
('BK-002', 'Mastering MySQL Database',           'Andi Nugroho',  2022, 95000,  5,  'Panduan lengkap MySQL untuk developer',             2, 5),
('BK-003', 'Laravel Framework Advanced',         'Siti Aminah',   2024, 125000, 8,  'Membangun aplikasi web modern dengan Laravel',      1, 1),
('BK-004', 'Web Design Principles',              'Dedi Santoso',  2023, 85000,  15, 'Prinsip dasar desain web yang baik dan menarik',    3, 4),
('BK-005', 'Network Security Fundamentals',      'Rina Wijaya',   2023, 110000, 3,  'Dasar-dasar keamanan jaringan komputer',            4, 3),
('BK-006', 'PHP Web Services',                   'Budi Raharjo',  2024, 90000,  12, 'Membangun REST API dengan PHP',                     1, 1),
('BK-007', 'PostgreSQL Advanced',                'Ahmad Yani',    2024, 115000, 7,  'Teknik lanjutan penggunaan PostgreSQL',             2, 5),
('BK-008', 'JavaScript Modern',                  'Siti Aminah',   2023, 80000,  0,  'Pemrograman JavaScript ES6 dan seterusnya',         1, 2),
('BK-009', 'Bootstrap 5 Lengkap',                'Ahmad Fauzi',   2022, 88000,  20, 'Panduan lengkap framework Bootstrap 5',             3, 1),
('BK-010', 'MongoDB untuk Developer',            'Siti Rahayu',   2022, 105000, 6,  'Panduan penggunaan MongoDB untuk developer',        2, 2),
('BK-011', 'PHP OOP Masterclass',                'Budi Raharjo',  2021, 130000, 4,  'Pemrograman berorientasi objek dengan PHP',         1, 3),
('BK-012', 'CSS Animation & Flexbox',            'Dewi Sartika',  2023, 92000,  9,  'Teknik animasi CSS dan layout dengan Flexbox',      3, 4),
('BK-013', 'Android Development dengan Kotlin',  'Reza Fauzan',   2024, 120000, 11, 'Membangun aplikasi Android dengan Kotlin',          5, 2),
('BK-014', 'Cisco Networking Essentials',        'Hendra Wijaya', 2022, 135000, 2,  'Panduan jaringan komputer berbasis Cisco',          4, 3),
('BK-015', 'Flutter untuk Pemula',               'Nurul Hidayah', 2024, 98000,  14, 'Membangun aplikasi mobile dengan Flutter',          5, 4);

-- 4. Query JOIN --
-- JOIN untuk tampilkan buku dengan nama kategori dan penerbit
SELECT 
    b.kode_buku,
    b.judul,
    b.pengarang,
    b.tahun,
    k.nama_kategori,
    p.nama_penerbit
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit;

-- Jumlah buku per kategori
SELECT 
    k.nama_kategori,
    COUNT(b.id_buku) AS jumlah_buku
FROM kategori_buku k
LEFT JOIN buku b ON b.id_kategori = k.id_kategori
GROUP BY k.id_kategori, k.nama_kategori;

-- Jumlah buku per penerbit
SELECT 
    p.nama_penerbit,
    COUNT(b.id_buku) AS jumlah_buku
FROM penerbit p
LEFT JOIN buku b ON b.id_penerbit = p.id_penerbit
GROUP BY p.id_penerbit, p.nama_penerbit;

-- Buku beserta detail lengkap (kategori + penerbit)
SELECT 
    b.id_buku,
    b.kode_buku,
    b.judul,
    b.pengarang,
    b.tahun,
    b.harga,
    b.stok,
    b.deskripsi,
    k.nama_kategori,
    k.deskripsi AS deskripsi_kategori,
    p.nama_penerbit,
    p.alamat,
    p.telepon,
    p.email
FROM buku b
JOIN kategori_buku k ON b.id_kategori = k.id_kategori
JOIN penerbit p ON b.id_penerbit = p.id_penerbit;
