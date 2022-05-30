-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Mar 2022 pada 03.46
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservasihotel`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteFasilitasHotel` (IN `id_fasilitas` INT(11))  DELETE FROM tbl_fasilitas_hotel WHERE id_fasilitas_hotel=id_fasilitas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deletefasilitaskamar` (IN `id_fasilitas` INT(11))  DELETE FROM tbl_fasilitas_kamar WHERE id_fasilitas_kamar=id_fasilitas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambahUser` (IN `uname` VARCHAR(30), IN `pass` CHAR(32), IN `nuser` VARCHAR(30), IN `level` ENUM('Admin','Petugas','Tamu'))  INSERT INTO user VALUES (uname, pass, nuser, level)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbluser`
--

CREATE TABLE `tbluser` (
  `username` varchar(30) NOT NULL,
  `password` char(32) NOT NULL,
  `namauser` varchar(30) NOT NULL,
  `leveluser` enum('Admin','Petugas','Tamu') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbluser`
--

INSERT INTO `tbluser` (`username`, `password`, `namauser`, `leveluser`) VALUES
('HelvaF', '202cb962ac59075b964b07152d234b70', 'HelvaFaizya', 'Admin'),
('petugas', '827ccb0eea8a706c4c34a16891f84e7b', 'zendaya', 'Petugas'),
('tamu', '202cb962ac59075b964b07152d234b70', 'tontawan', 'Tamu'),
('wawan', '202cb962ac59075b964b07152d234b70', 'petugas', 'Petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_detail_kamar`
--

CREATE TABLE `tbl_detail_kamar` (
  `id_detail_kamar` int(50) NOT NULL,
  `id_kamar` int(50) NOT NULL,
  `id_fasilitas_kamar` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_detail_kamar`
--

INSERT INTO `tbl_detail_kamar` (`id_detail_kamar`, `id_kamar`, `id_fasilitas_kamar`) VALUES
(2, 2, 6),
(3, 2, 7),
(4, 2, 8),
(5, 2, 9),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 3, 11),
(35, 5, 6),
(36, 5, 7),
(37, 5, 8),
(38, 5, 9),
(39, 5, 11),
(40, 5, 12),
(41, 5, 13),
(42, 5, 14),
(43, 5, 15),
(44, 4, 6),
(45, 4, 7),
(46, 4, 8),
(47, 4, 9),
(48, 4, 11),
(49, 4, 12),
(50, 4, 13);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_fasilitas_hotel`
--

CREATE TABLE `tbl_fasilitas_hotel` (
  `id_fasilitas_hotel` int(11) NOT NULL,
  `nama_fasilitas` varchar(20) NOT NULL,
  `deskripsi_fasilitas` varchar(100) NOT NULL,
  `foto_fasilitas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_fasilitas_hotel`
--

INSERT INTO `tbl_fasilitas_hotel` (`id_fasilitas_hotel`, `nama_fasilitas`, `deskripsi_fasilitas`, `foto_fasilitas`) VALUES
(17, 'Meeting Room', 'Meeting Room', 'meetingroom.jpg'),
(18, 'Restaurant', 'Restaurant', 'sapphire-restaurant1.jpg'),
(19, 'Fitness Room', 'Fitness Room', 'gym.jpeg'),
(20, 'Kolam Renang', 'Kolam Renang', 'krenang.jpg'),
(21, 'Massage Room', 'Massage Room', 'spa.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_fasilitas_kamar`
--

CREATE TABLE `tbl_fasilitas_kamar` (
  `id_fasilitas_kamar` int(11) NOT NULL,
  `nama_fasilitas` varchar(100) NOT NULL,
  `deskripsi_fasilitas` varchar(100) NOT NULL,
  `foto_fasilitas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_fasilitas_kamar`
--

INSERT INTO `tbl_fasilitas_kamar` (`id_fasilitas_kamar`, `nama_fasilitas`, `deskripsi_fasilitas`, `foto_fasilitas`) VALUES
(6, 'Smart Tv', 'Smart TV', 'televisi-di-atas-lemari.jpg'),
(7, 'Wifi', 'Free Wifi', '31472002711.jpg'),
(8, 'Meja Kerja', 'Meja Kerja Pribadi', 'meja kerja.jpg'),
(9, 'Kulkas Mini', 'Mini Kulkas', 'kulkas mini.jpg'),
(11, 'Sofa Kamar', 'Sofa Kamar', 'sofa.jpg'),
(12, 'Meja Makan', 'Meja Makan', 'meja makan.jpg'),
(13, 'Deposit Box', 'Deposit Box', 'deposit box.jpeg'),
(14, 'Microwafe', 'Microwafe', 'microwafe.webp'),
(15, 'Coffe Machine', 'Coffe Machine', 'coffemachine.jpg');

--
-- Trigger `tbl_fasilitas_kamar`
--
DELIMITER $$
CREATE TRIGGER `hapusFasilitasKamar` AFTER DELETE ON `tbl_fasilitas_kamar` FOR EACH ROW DELETE FROM tbl_detail_kamar WHERE id_fasilitas_kamar=OLD.id_fasilitas_kamar
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kamar`
--

CREATE TABLE `tbl_kamar` (
  `id_kamar` int(100) NOT NULL,
  `harga_kamar` int(50) NOT NULL,
  `tipe_kamar` varchar(250) NOT NULL,
  `foto_kamar` varchar(150) NOT NULL,
  `jml_kamar` mediumint(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kamar`
--

INSERT INTO `tbl_kamar` (`id_kamar`, `harga_kamar`, `tipe_kamar`, `foto_kamar`, `jml_kamar`) VALUES
(2, 150000, 'single', 'singel room.jpg', 10),
(3, 350000, 'standar', 'StandardRoom.jpg', 10),
(4, 500000, 'deluxe', 'deluxe.jpg', 5),
(5, 850000, 'suite', 'suite.jpg', 3);

--
-- Trigger `tbl_kamar`
--
DELIMITER $$
CREATE TRIGGER `hapusDetailKamar` AFTER DELETE ON `tbl_kamar` FOR EACH ROW delete from tbl_detail_kamar where tbl_detail_kamar.id_kamar=old.id_kamar
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_reservasi`
--

CREATE TABLE `tbl_reservasi` (
  `id_reservasi` int(11) NOT NULL,
  `nama_pemesan` varchar(100) NOT NULL,
  `no_handphone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama_tamu` varchar(100) NOT NULL,
  `jml_kamar_dipesan` int(11) NOT NULL,
  `id_kamar` int(11) NOT NULL,
  `tgl_cek_in` date NOT NULL,
  `tgl_cek_out` date NOT NULL,
  `status` enum('in','out') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_reservasi`
--

INSERT INTO `tbl_reservasi` (`id_reservasi`, `nama_pemesan`, `no_handphone`, `email`, `nama_tamu`, `jml_kamar_dipesan`, `id_kamar`, `tgl_cek_in`, `tgl_cek_out`, `status`) VALUES
(2, 'Helva Faizya', '083824950716', 'helvafaizya110604@gmail.com', 'Zayn Malik', 1, 4, '2022-03-27', '2022-03-28', 'in'),
(4, 'Rara', '0812381289', 'rara@gmail.com', 'riri', 1, 2, '2022-03-24', '2022-03-25', 'in'),
(6, 'helva faizya', '098765432345', 'helvafaizya110604@gmail.com', 'lili', 1, 5, '2022-03-02', '2022-03-04', 'in');

--
-- Trigger `tbl_reservasi`
--
DELIMITER $$
CREATE TRIGGER `CheckIn` AFTER UPDATE ON `tbl_reservasi` FOR EACH ROW BEGIN
   	 IF (NEW.status='in') THEN
   		 UPDATE tbl_kamar SET jml_kamar=jml_kamar-OLD.jml_kamar_dipesan
   		 WHERE tbl_kamar.id_kamar=NEW.id_kamar;
   	 ELSE
   		 UPDATE tbl_kamar SET jml_kamar=jml_kamar+OLD.jml_kamar_dipesan
   		 WHERE tbl_kamar.id_kamar=NEW.id_kamar;   	 
   	 END IF;    
    END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tbl_detail_kamar`
--
ALTER TABLE `tbl_detail_kamar`
  ADD PRIMARY KEY (`id_detail_kamar`);

--
-- Indeks untuk tabel `tbl_fasilitas_hotel`
--
ALTER TABLE `tbl_fasilitas_hotel`
  ADD PRIMARY KEY (`id_fasilitas_hotel`);

--
-- Indeks untuk tabel `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  ADD PRIMARY KEY (`id_fasilitas_kamar`);

--
-- Indeks untuk tabel `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indeks untuk tabel `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  ADD PRIMARY KEY (`id_reservasi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_detail_kamar`
--
ALTER TABLE `tbl_detail_kamar`
  MODIFY `id_detail_kamar` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `tbl_fasilitas_hotel`
--
ALTER TABLE `tbl_fasilitas_hotel`
  MODIFY `id_fasilitas_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `tbl_fasilitas_kamar`
--
ALTER TABLE `tbl_fasilitas_kamar`
  MODIFY `id_fasilitas_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tbl_kamar`
--
ALTER TABLE `tbl_kamar`
  MODIFY `id_kamar` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_reservasi`
--
ALTER TABLE `tbl_reservasi`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
