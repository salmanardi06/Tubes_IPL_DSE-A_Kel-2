-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 09:47 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_daftar ta`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen pembimbing`
--

CREATE TABLE `dosen pembimbing` (
  `id_Dosen` int(5) NOT NULL,
  `Nip` int(8) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `No_Telpon` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(5) NOT NULL,
  `Nama_Jurusan` char(30) NOT NULL,
  `Program studi` char(30) NOT NULL,
  `Fakultas` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_Mahasiswa` int(8) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Nim` int(10) NOT NULL,
  `Jenis_Kelamin` char(1) NOT NULL,
  `No_telpon` int(12) NOT NULL,
  `Alamat` int(50) NOT NULL,
  `id_Jurusan` int(30) NOT NULL,
  `Tugas Akhir` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tugas akhir`
--

CREATE TABLE `tugas akhir` (
  `id_Tugas_akhir` int(5) NOT NULL,
  `id_Mahasiswa` int(8) NOT NULL,
  `id_Dosen` int(5) NOT NULL,
  `judul` char(30) NOT NULL,
  `Deskripsi` text NOT NULL,
  `status` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen pembimbing`
--
ALTER TABLE `dosen pembimbing`
  ADD PRIMARY KEY (`id_Dosen`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_Mahasiswa`),
  ADD KEY `id_Jurusan` (`id_Jurusan`);

--
-- Indexes for table `tugas akhir`
--
ALTER TABLE `tugas akhir`
  ADD PRIMARY KEY (`id_Tugas_akhir`),
  ADD KEY `id_Mahasiswa` (`id_Mahasiswa`),
  ADD KEY `id_Dosen` (`id_Dosen`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_Jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Constraints for table `tugas akhir`
--
ALTER TABLE `tugas akhir`
  ADD CONSTRAINT `tugas akhir_ibfk_1` FOREIGN KEY (`id_Mahasiswa`) REFERENCES `mahasiswa` (`id_Mahasiswa`),
  ADD CONSTRAINT `tugas akhir_ibfk_2` FOREIGN KEY (`id_Dosen`) REFERENCES `dosen pembimbing` (`id_Dosen`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
