-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2022 at 01:09 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_obat`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_obat`
--

CREATE TABLE `tb_obat` (
  `kd_obat` varchar(32) NOT NULL,
  `nm_obat` varchar(32) NOT NULL,
  `tgl_kadaluarsa` date NOT NULL,
  `stok` int(11) NOT NULL,
  `satuan` varchar(32) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_obat`
--

INSERT INTO `tb_obat` (`kd_obat`, `nm_obat`, `tgl_kadaluarsa`, `stok`, `satuan`, `harga`) VALUES
('KDO001', 'Paracetamol', '2022-09-23', 390, 'Pack', 13000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_obat_keluar`
--

CREATE TABLE `tb_obat_keluar` (
  `id` int(11) NOT NULL,
  `kd_obat` varchar(32) NOT NULL,
  `tanggal` date NOT NULL,
  `jml_obat_keluar` int(11) NOT NULL,
  `satuan` varchar(32) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_obat_keluar`
--

INSERT INTO `tb_obat_keluar` (`id`, `kd_obat`, `tanggal`, `jml_obat_keluar`, `satuan`, `harga`) VALUES
(4, 'KDO001', '2022-09-23', 10, 'Pack', 13000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_obat_masuk`
--

CREATE TABLE `tb_obat_masuk` (
  `id` int(11) NOT NULL,
  `id_suplier` varchar(32) NOT NULL,
  `kd_obat` varchar(32) NOT NULL,
  `tanggal` date NOT NULL,
  `jml_obat_masuk` int(11) NOT NULL,
  `satuan` varchar(32) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_obat_masuk`
--

INSERT INTO `tb_obat_masuk` (`id`, `id_suplier`, `kd_obat`, `tanggal`, `jml_obat_masuk`, `satuan`, `harga`) VALUES
(8, '101012', 'KDO001', '2022-09-23', 100, 'Pack', 13000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_suplier`
--

CREATE TABLE `tb_suplier` (
  `id_suplier` varchar(32) NOT NULL,
  `nm_suplier` varchar(32) NOT NULL,
  `alamat_suplier` text NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_suplier`
--

INSERT INTO `tb_suplier` (`id_suplier`, `nm_suplier`, `alamat_suplier`, `username`, `password`) VALUES
('101012', 'Test Suplier 1', 'Watansoppeng', 'test', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nm_user` varchar(32) NOT NULL,
  `alamat_user` text NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nm_user`, `alamat_user`, `username`, `password`, `level`) VALUES
(1, 'Nama Admin', 'Watansoppeng', 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'admin'),
(2, 'Nama Pemilik', 'Watansoppeng', 'pemilik', 'e10adc3949ba59abbe56e057f20f883e', 'pemilik');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_obat`
-- (See below for the actual view)
--
CREATE TABLE `view_obat` (
`kd_obat` varchar(32)
,`nm_obat` varchar(32)
,`satuan` varchar(32)
,`tgl_kadaluarsa` date
,`stok` int(11)
,`masa_kadaluarsa` int(7)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_obat_keluar`
-- (See below for the actual view)
--
CREATE TABLE `view_obat_keluar` (
`kd_obat` varchar(32)
,`nm_obat` varchar(32)
,`tgl_kadaluarsa` date
,`stok` int(11)
,`id_obat_keluar` int(11)
,`tanggal` date
,`jml_obat_keluar` int(11)
,`satuan` varchar(32)
,`harga` int(11)
,`ttl_harga` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_obat_masuk`
-- (See below for the actual view)
--
CREATE TABLE `view_obat_masuk` (
`kd_obat` varchar(32)
,`nm_obat` varchar(32)
,`tgl_kadaluarsa` date
,`stok` int(11)
,`id_suplier` varchar(32)
,`nm_suplier` varchar(32)
,`alamat_suplier` text
,`id_obat_masuk` int(11)
,`tanggal` date
,`jml_obat_masuk` int(11)
,`satuan` varchar(32)
,`harga` int(11)
,`ttl_harga` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `view_obat`
--
DROP TABLE IF EXISTS `view_obat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_obat`  AS  select `tb_obat`.`kd_obat` AS `kd_obat`,`tb_obat`.`nm_obat` AS `nm_obat`,`tb_obat`.`satuan` AS `satuan`,`tb_obat`.`tgl_kadaluarsa` AS `tgl_kadaluarsa`,`tb_obat`.`stok` AS `stok`,(to_days(`tb_obat`.`tgl_kadaluarsa`) - to_days(curdate())) AS `masa_kadaluarsa` from `tb_obat` ;

-- --------------------------------------------------------

--
-- Structure for view `view_obat_keluar`
--
DROP TABLE IF EXISTS `view_obat_keluar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_obat_keluar`  AS  select `tb_obat`.`kd_obat` AS `kd_obat`,`tb_obat`.`nm_obat` AS `nm_obat`,`tb_obat`.`tgl_kadaluarsa` AS `tgl_kadaluarsa`,`tb_obat`.`stok` AS `stok`,`tb_obat_keluar`.`id` AS `id_obat_keluar`,`tb_obat_keluar`.`tanggal` AS `tanggal`,`tb_obat_keluar`.`jml_obat_keluar` AS `jml_obat_keluar`,`tb_obat_keluar`.`satuan` AS `satuan`,`tb_obat_keluar`.`harga` AS `harga`,(`tb_obat_keluar`.`harga` * `tb_obat_keluar`.`jml_obat_keluar`) AS `ttl_harga` from (`tb_obat` join `tb_obat_keluar` on((`tb_obat`.`kd_obat` = `tb_obat_keluar`.`kd_obat`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_obat_masuk`
--
DROP TABLE IF EXISTS `view_obat_masuk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_obat_masuk`  AS  select `tb_obat`.`kd_obat` AS `kd_obat`,`tb_obat`.`nm_obat` AS `nm_obat`,`tb_obat`.`tgl_kadaluarsa` AS `tgl_kadaluarsa`,`tb_obat`.`stok` AS `stok`,`tb_suplier`.`id_suplier` AS `id_suplier`,`tb_suplier`.`nm_suplier` AS `nm_suplier`,`tb_suplier`.`alamat_suplier` AS `alamat_suplier`,`tb_obat_masuk`.`id` AS `id_obat_masuk`,`tb_obat_masuk`.`tanggal` AS `tanggal`,`tb_obat_masuk`.`jml_obat_masuk` AS `jml_obat_masuk`,`tb_obat_masuk`.`satuan` AS `satuan`,`tb_obat_masuk`.`harga` AS `harga`,(`tb_obat_masuk`.`harga` * `tb_obat_masuk`.`jml_obat_masuk`) AS `ttl_harga` from ((`tb_obat` join `tb_obat_masuk` on((`tb_obat`.`kd_obat` = `tb_obat_masuk`.`kd_obat`))) join `tb_suplier` on((`tb_obat_masuk`.`id_suplier` = `tb_suplier`.`id_suplier`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_obat`
--
ALTER TABLE `tb_obat`
  ADD PRIMARY KEY (`kd_obat`);

--
-- Indexes for table `tb_obat_keluar`
--
ALTER TABLE `tb_obat_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_produk` (`kd_obat`);

--
-- Indexes for table `tb_obat_masuk`
--
ALTER TABLE `tb_obat_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_suplier` (`id_suplier`),
  ADD KEY `kd_obat` (`kd_obat`);

--
-- Indexes for table `tb_suplier`
--
ALTER TABLE `tb_suplier`
  ADD PRIMARY KEY (`id_suplier`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_obat_keluar`
--
ALTER TABLE `tb_obat_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_obat_masuk`
--
ALTER TABLE `tb_obat_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
