/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.14-MariaDB : Database - bukukas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`bukukas` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

/* Table structure for table `pemasukan` */

DROP TABLE IF EXISTS `pemasukan`;

CREATE TABLE `pemasukan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `kategori` varchar(10) DEFAULT NULL,
  `jenis_dana` varchar(50) DEFAULT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/* Data for the table `pemasukan` */

insert  into `pemasukan`(`id`,`tanggal`,`kategori`,`jenis_dana`,`nominal`,`created_by`) values 
(1,'2021-01-24','MTS','PAS',500000,1),
(2,'2021-01-18','SMP','PAS',100000,1),
(3,'2021-01-26','MMA','PTS',5000000,1),
(4,'2021-01-24','MTS','SPP',2500000,2),
(5,'2021-01-24','MTS','SPP',2700000,3);

/* Table structure for table `pengeluaran` */

DROP TABLE IF EXISTS `pengeluaran`;

CREATE TABLE `pengeluaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `tipe_pengeluaran` varchar(50) DEFAULT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/* Data for the table `pengeluaran` */

insert  into `pengeluaran`(`id`,`tanggal`,`tipe_pengeluaran`,`nominal`,`created_by`) values 
(1,'2021-01-24','PERJALANAN DINAS',15000,1),
(2,'2021-01-24','OPERASIONAL HARIAN',1000000,2),
(3,'2021-01-24','HONOR KARYAWAN',1500000,3);

/* Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `fcm_token` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`nama_lengkap`,`no_hp`,`alamat`,`foto`,`fcm_token`) values 
(1,'andri','202cb962ac59075b964b07152d234b70','andri	','087387274234','Jakarta pusat',NULL,NULL),
(2,'edward','202cb962ac59075b964b07152d234b70','edward','0878378262892','Jakarta pusat',NULL,NULL),
(3,'ramelan','827ccb0eea8a706c4c34a16891f84e7b','Ramelan eko pamuji','083813997825','Tangerang selatan',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
