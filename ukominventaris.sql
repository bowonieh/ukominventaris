/*
 Navicat Premium Data Transfer

 Source Server         : dbinventaris
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : ukominventaris

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 14/10/2021 14:12:17
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barang
-- ----------------------------
DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang` (
  `id_barang` int NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `spesifikasi` text NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `jumlah_barang` int NOT NULL,
  `sumber_dana` varchar(25) NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of barang
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for barang_keluar
-- ----------------------------
DROP TABLE IF EXISTS `barang_keluar`;
CREATE TABLE `barang_keluar` (
  `id_barang` int NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `jml_keluar` int NOT NULL,
  `id_supplier` int NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of barang_keluar
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for barang_masuk
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk`;
CREATE TABLE `barang_masuk` (
  `id_barang` int NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `jml_masuk` int NOT NULL,
  `id_supplier` int NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of barang_masuk
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pinjam_barang
-- ----------------------------
DROP TABLE IF EXISTS `pinjam_barang`;
CREATE TABLE `pinjam_barang` (
  `id_pinjam` int NOT NULL,
  `peminjam` varchar(50) NOT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `id_barang` int NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jml_barang` int NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `kondisi` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_pinjam`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of pinjam_barang
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for stok
-- ----------------------------
DROP TABLE IF EXISTS `stok`;
CREATE TABLE `stok` (
  `id_barang` int NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jml_masuk` int NOT NULL,
  `jml_keluar` int NOT NULL,
  `total_barang` int NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of stok
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id_supplier` int NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat_supplier` varchar(100) NOT NULL,
  `telp_supplier` varchar(13) NOT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB;

-- ----------------------------
-- Records of supplier
-- ----------------------------
BEGIN;
INSERT INTO `supplier` VALUES (1, 'STMIK Bani Saleh', '', '');
INSERT INTO `supplier` VALUES (2, 'STIKES BANI SALEH', '-', '88345064');
INSERT INTO `supplier` VALUES (3, 'STAI BANI SALEH', '-', '88343360');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `level` char(20) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'Teknik Komputer', 'tk', 'tk', 'peminjam');
INSERT INTO `user` VALUES (2, 'Manajemen Informasi', 'mi', 'mi', 'peminjam');
INSERT INTO `user` VALUES (3, 'Komputer Akuntansi', 'ka', 'ka', 'peminjam');
INSERT INTO `user` VALUES (4, 'Sistem Informasi', 'si', 'si', 'manajemen');
INSERT INTO `user` VALUES (5, 'Teknik Informatika', 'ti', 'ti', 'administrator');
COMMIT;

-- ----------------------------
-- Procedure structure for batal_keluar
-- ----------------------------
DROP PROCEDURE IF EXISTS `batal_keluar`;
delimiter ;;
CREATE PROCEDURE `batal_keluar`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for batal_masuk
-- ----------------------------
DROP PROCEDURE IF EXISTS `batal_masuk`;
delimiter ;;
CREATE PROCEDURE `batal_masuk`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for kembali
-- ----------------------------
DROP PROCEDURE IF EXISTS `kembali`;
delimiter ;;
CREATE PROCEDURE `kembali`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for pinjam
-- ----------------------------
DROP PROCEDURE IF EXISTS `pinjam`;
delimiter ;;
CREATE PROCEDURE `pinjam`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for tambah_keluar
-- ----------------------------
DROP PROCEDURE IF EXISTS `tambah_keluar`;
delimiter ;;
CREATE PROCEDURE `tambah_keluar`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for tambah_masuk
-- ----------------------------
DROP PROCEDURE IF EXISTS `tambah_masuk`;
delimiter ;;
CREATE PROCEDURE `tambah_masuk`()

;;
delimiter ;

-- ----------------------------
-- Triggers structure for table barang
-- ----------------------------
DROP TRIGGER IF EXISTS `ins_stok`;
delimiter ;;
CREATE TRIGGER `ins_stok` AFTER INSERT ON `barang` FOR EACH ROW BEGIN
INSERT INTO stok (id_barang,nama_barang)values
(NEW.id_barang,NEW.nama_barang);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table barang
-- ----------------------------
DROP TRIGGER IF EXISTS `del_stok`;
delimiter ;;
CREATE TRIGGER `del_stok` AFTER DELETE ON `barang` FOR EACH ROW BEGIN
DELETE FROM stok WHERE stok.id_barang=OLD.id_barang;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table barang
-- ----------------------------
DROP TRIGGER IF EXISTS `upt_stok`;
delimiter ;;
CREATE TRIGGER `upt_stok` AFTER UPDATE ON `barang` FOR EACH ROW BEGIN
UPDATE stok SET stok.nama_barang=NEW.nama_barang WHERE
stok.id_barang=OLD.id_barang;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
