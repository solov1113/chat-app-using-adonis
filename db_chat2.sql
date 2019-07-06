/*
SQLyog Community v13.1.2 (64 bit)
MySQL - 10.1.38-MariaDB : Database - db_chat2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_chat2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_chat2`;

/*Table structure for table `adonis_schema` */

DROP TABLE IF EXISTS `adonis_schema`;

CREATE TABLE `adonis_schema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `adonis_schema` */

insert  into `adonis_schema`(`id`,`name`,`batch`,`migration_time`) values 
(1,'1503250034279_user',1,'2019-07-02 17:52:49'),
(2,'1503250034280_token',1,'2019-07-02 17:52:49'),
(3,'1562063294825_room_schema',1,'2019-07-02 17:52:49'),
(4,'1562064635748_chat_schema',1,'2019-07-02 17:52:49'),
(5,'1562064679256_user_room_schema',1,'2019-07-02 17:52:49');

/*Table structure for table `chats` */

DROP TABLE IF EXISTS `chats`;

CREATE TABLE `chats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` text,
  `user_id` int(10) unsigned DEFAULT NULL,
  `room_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chats_user_id_foreign` (`user_id`),
  KEY `chats_room_id_foreign` (`room_id`),
  CONSTRAINT `chats_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  CONSTRAINT `chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

/*Data for the table `chats` */

insert  into `chats`(`id`,`text`,`user_id`,`room_id`,`created_at`,`updated_at`) values 
(3,'asek asek',3,1,'2019-07-02 23:53:09','2019-07-03 00:04:17'),
(4,'As',1,1,'2019-07-02 23:53:53','2019-07-03 00:08:54'),
(11,'Ini room 2',2,3,'2019-07-03 01:12:43','2019-07-03 01:12:43'),
(13,'Vhh',2,1,'2019-07-03 01:28:58','2019-07-03 01:28:58'),
(18,'Room 1 anjay',2,1,'2019-07-03 01:55:54','2019-07-03 01:55:54'),
(21,'Room aselole',2,3,'2019-07-03 02:10:15','2019-07-03 02:10:15'),
(22,'Room bootcamp',2,1,'2019-07-03 02:15:27','2019-07-03 02:15:27'),
(57,'Youtube.com',1,1,'2019-07-04 14:28:50','2019-07-04 14:28:50'),
(58,'https://amp.kaskus.co.id/thread/000000000000000014177106/yang-pingin-tau-arti-kata-aselole-masuk-gan',1,1,'2019-07-04 14:48:43','2019-07-04 14:48:43'),
(60,'https://youtu.be/R_LSWNtJKlk',1,1,'2019-07-04 14:58:33','2019-07-04 14:58:33'),
(69,'Group kedua',1,3,'2019-07-04 22:14:33','2019-07-04 22:14:33'),
(71,'Ok',6,6,'2019-07-05 13:55:14','2019-07-05 13:55:14'),
(72,'Jekeke',1,1,'2019-07-05 15:09:13','2019-07-05 15:09:13'),
(74,'tes',6,NULL,'2019-07-05 19:24:24','2019-07-05 19:24:24'),
(75,'Jsjsjjs',1,1,'2019-07-05 19:27:44','2019-07-05 19:27:44'),
(76,'Ook',1,6,'2019-07-05 19:28:31','2019-07-05 19:28:31');

/*Table structure for table `rooms` */

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` enum('private','group') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `rooms` */

insert  into `rooms`(`id`,`name`,`type`,`created_at`,`updated_at`) values 
(1,'Group Bootcamp Batch 10','group','2019-07-02 18:28:40','2019-07-02 18:28:40'),
(3,'Group Kedua','group','2019-07-02 22:46:22','2019-07-02 22:46:22'),
(6,'Group Ketiga','group','2019-07-04 21:57:34','2019-07-04 21:57:34');

/*Table structure for table `tokens` */

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unique` (`token`),
  KEY `tokens_user_id_foreign` (`user_id`),
  KEY `tokens_token_index` (`token`),
  CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

/*Data for the table `tokens` */

insert  into `tokens`(`id`,`user_id`,`token`,`type`,`is_revoked`,`created_at`,`updated_at`) values 
(1,1,'d01228a5-3eb2-44f7-9501-a4b39f086be5','jwt_refresh_token',0,'2019-07-02 18:26:39','2019-07-02 18:26:39'),
(2,1,'d9930a6e-790c-4894-aaf9-df4601aead75','jwt_refresh_token',0,'2019-07-02 21:10:51','2019-07-02 21:10:51'),
(3,1,'dbc5c4c3-417f-47df-99be-76ac987cfdd1','jwt_refresh_token',0,'2019-07-02 22:16:29','2019-07-02 22:16:29'),
(4,1,'5529733e-920d-4c0a-9611-c38795eff10d','jwt_refresh_token',0,'2019-07-02 22:30:35','2019-07-02 22:30:35'),
(5,1,'c13814eb-baa8-4fc1-a9d2-c9e0307f2bc3','jwt_refresh_token',0,'2019-07-02 22:33:00','2019-07-02 22:33:00'),
(6,1,'89b55afe-c95e-443d-b25e-2b32f702e535','jwt_refresh_token',0,'2019-07-02 22:33:32','2019-07-02 22:33:32'),
(7,1,'c920267f-740d-45c9-8e30-116c0d691929','jwt_refresh_token',0,'2019-07-02 22:33:45','2019-07-02 22:33:45'),
(8,1,'63b751ac-c4c5-45e5-b1bf-6c6c5cf03e1b','jwt_refresh_token',0,'2019-07-02 22:34:13','2019-07-02 22:34:13'),
(9,1,'04b98187-2c1d-498a-bc8d-62bb31a98538','jwt_refresh_token',0,'2019-07-02 22:34:52','2019-07-02 22:34:52'),
(10,1,'f538bf90-3417-431e-855e-ddeedaf4bac8','jwt_refresh_token',0,'2019-07-02 22:35:42','2019-07-02 22:35:42'),
(11,1,'fcf7b2ca-8c43-483a-a10f-f6042a8e74d7','jwt_refresh_token',0,'2019-07-02 22:51:43','2019-07-02 22:51:43'),
(12,1,'6acf7daf-b4dc-46ea-a8d9-b63ab31d76d4','jwt_refresh_token',0,'2019-07-02 22:55:21','2019-07-02 22:55:21'),
(13,1,'401fc221-32a4-4b87-8faa-e6bcdd6e3879','jwt_refresh_token',0,'2019-07-02 22:55:45','2019-07-02 22:55:45'),
(14,2,'4a934487-e8d4-4021-b61b-007dae709ea1','jwt_refresh_token',0,'2019-07-03 00:13:45','2019-07-03 00:13:45'),
(15,1,'431b538a-6c36-4e3d-bffa-c09f92f36f4d','jwt_refresh_token',0,'2019-07-03 02:17:59','2019-07-03 02:17:59'),
(16,2,'f3d80e75-fdf2-4e05-891c-48d031293784','jwt_refresh_token',0,'2019-07-03 02:26:51','2019-07-03 02:26:51'),
(17,1,'5506f3bb-1760-4183-9173-3446d5965032','jwt_refresh_token',0,'2019-07-03 02:27:19','2019-07-03 02:27:19'),
(18,1,'82768d2e-a665-40c9-ae27-c3978a062dc6','jwt_refresh_token',0,'2019-07-03 02:45:00','2019-07-03 02:45:00'),
(19,1,'b61099fd-7c83-46dc-a0ff-203128e85c7b','jwt_refresh_token',0,'2019-07-03 10:15:51','2019-07-03 10:15:51'),
(20,1,'22c80d25-2b99-4eaa-bee8-7658793d8b53','jwt_refresh_token',0,'2019-07-03 11:23:58','2019-07-03 11:23:58'),
(21,1,'aee2c729-9ddb-4ac1-956d-3e65161ff70c','jwt_refresh_token',0,'2019-07-03 11:27:07','2019-07-03 11:27:07'),
(22,1,'c5dd5418-5df0-46c1-9947-fc2a8481843c','jwt_refresh_token',0,'2019-07-03 11:29:35','2019-07-03 11:29:35'),
(23,1,'75c014c2-8e99-4eb4-9beb-50303240e5c3','jwt_refresh_token',0,'2019-07-03 11:40:17','2019-07-03 11:40:17'),
(24,1,'563d6b1f-7c3e-4027-a8bd-8d75e90c4fd9','jwt_refresh_token',0,'2019-07-03 14:59:03','2019-07-03 14:59:03'),
(25,1,'780ed994-3826-47d0-a4b3-6eeca271ed58','jwt_refresh_token',0,'2019-07-03 17:32:43','2019-07-03 17:32:43'),
(26,1,'d90b60bf-6323-4096-85ea-338c5fff27bb','jwt_refresh_token',0,'2019-07-03 17:34:19','2019-07-03 17:34:19'),
(27,1,'efe5e37f-1e8a-416c-8faf-581f529f2097','jwt_refresh_token',0,'2019-07-04 17:00:59','2019-07-04 17:00:59'),
(28,1,'55fddaf4-f8bb-4d8a-b329-f8935222685c','jwt_refresh_token',0,'2019-07-04 17:47:02','2019-07-04 17:47:02'),
(29,1,'b4fea6cd-041b-462a-bfee-139c87119171','jwt_refresh_token',0,'2019-07-04 19:13:19','2019-07-04 19:13:19'),
(30,1,'78e53fb5-a4aa-4575-8488-e2a46f9b3fd6','jwt_refresh_token',0,'2019-07-04 20:25:58','2019-07-04 20:25:58'),
(31,2,'5d59c4f5-cf28-40de-a830-037f12e67a9d','jwt_refresh_token',0,'2019-07-04 21:47:04','2019-07-04 21:47:04'),
(32,1,'e9d2b438-f46e-49e8-931e-7c0c64708fa7','jwt_refresh_token',0,'2019-07-04 21:47:41','2019-07-04 21:47:41'),
(33,1,'887e7cbf-4bdb-4609-a5e0-9e010ed95e01','jwt_refresh_token',0,'2019-07-04 21:56:23','2019-07-04 21:56:23'),
(34,1,'cb4acced-bc2b-4ab7-ac53-ede518773660','jwt_refresh_token',0,'2019-07-04 22:14:07','2019-07-04 22:14:07'),
(35,1,'cb1a5aba-1855-4399-a346-acf21799d1b8','jwt_refresh_token',0,'2019-07-04 22:24:31','2019-07-04 22:24:31'),
(36,1,'6a89cfaa-c58a-4ff2-b16b-3b6255b8dd18','jwt_refresh_token',0,'2019-07-04 22:29:11','2019-07-04 22:29:11'),
(37,1,'8077bc47-0f92-4fbb-8d07-04638e8cf679','jwt_refresh_token',0,'2019-07-04 22:43:09','2019-07-04 22:43:09'),
(38,1,'b65ae697-94f0-481e-8397-94b0b5a35230','jwt_refresh_token',0,'2019-07-04 22:53:09','2019-07-04 22:53:09'),
(39,4,'c66a3249-bd02-4d8b-b2ac-85dd8976ebd6','jwt_refresh_token',0,'2019-07-05 11:50:28','2019-07-05 11:50:28'),
(40,4,'6d42745a-0b2d-40f5-b757-b0d30e1bde53','jwt_refresh_token',0,'2019-07-05 13:53:35','2019-07-05 13:53:35'),
(41,6,'c09f40f0-ae67-4f52-87d2-d83f224703c1','jwt_refresh_token',0,'2019-07-05 13:54:47','2019-07-05 13:54:47'),
(42,1,'3efd7142-2e42-42d2-989e-a131d63a4cf8','jwt_refresh_token',0,'2019-07-05 15:08:16','2019-07-05 15:08:16'),
(43,6,'65344e02-8e14-4256-b587-d464e4948287','jwt_refresh_token',0,'2019-07-05 15:54:43','2019-07-05 15:54:43'),
(44,6,'cda99523-53fb-465a-998c-35a1ff3cb007','jwt_refresh_token',0,'2019-07-05 15:56:03','2019-07-05 15:56:03'),
(45,1,'19c2d527-9e88-441d-9df3-dfaad860a78e','jwt_refresh_token',0,'2019-07-06 10:06:44','2019-07-06 10:06:44'),
(46,6,'e0a2ea3d-b7b4-4efb-8a81-838774a3a0e7','jwt_refresh_token',0,'2019-07-06 10:07:12','2019-07-06 10:07:12'),
(47,1,'5c911079-c60c-47cd-9a4f-eb551d076252','jwt_refresh_token',0,'2019-07-06 10:08:25','2019-07-06 10:08:25');

/*Table structure for table `user_rooms` */

DROP TABLE IF EXISTS `user_rooms`;

CREATE TABLE `user_rooms` (
  `user_id` int(10) unsigned DEFAULT NULL,
  `room_id` int(10) unsigned DEFAULT NULL,
  KEY `user_rooms_user_id_foreign` (`user_id`),
  KEY `user_rooms_room_id_foreign` (`room_id`),
  CONSTRAINT `user_rooms_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  CONSTRAINT `user_rooms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_rooms` */

insert  into `user_rooms`(`user_id`,`room_id`) values 
(1,1),
(1,3),
(1,6),
(4,3),
(5,3),
(6,6);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(80) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(60) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`email`,`password`,`avatar`,`created_at`,`updated_at`) values 
(1,'feri','feri@gmail.com','$2a$10$RWwsI7GR8irlOiLkR2WBDe/nMXE4LV02CvB46ElP28jE3Tt48Ltu2',NULL,'2019-07-02 18:26:06','2019-07-02 18:26:06'),
(2,'galih','galih@gmail.com','$2a$10$XUPHij.bL31joj2OzADM.efAosKYmKn8LNz9aLJVWrVizLeUlEjCO',NULL,'2019-07-02 23:46:16','2019-07-02 23:46:16'),
(3,'aden','aden@gmail.com','$2a$10$W0OBCvQUgVbhSK2712GFzuJ3lPjyKJRwqvj9IsL3kgrrfSrpHCcaS',NULL,'2019-07-02 23:46:40','2019-07-02 23:46:40'),
(4,'ari','ari@gmail.com','$2a$10$jUgL22W.RZgi3stvTRCqt.PS0IK73l1qP0e26LjLyFTE/SPhKsbPm',NULL,'2019-07-02 23:46:48','2019-07-02 23:46:48'),
(5,'aqil','aqil@gmail.com','$2a$10$t9Us.ny.JBPYuV2lPcIanOZm1HrRigwdCjiT2iKuNM6gVxMcXjLJ.',NULL,'2019-07-02 23:47:03','2019-07-02 23:47:03'),
(6,'fizi','fizi@gmail.com','$2a$10$KC9x1Akf84rQnRmU8bRC1eopKQsbFCkaa4F6eWNGJD4VTrWg81pyC',NULL,'2019-07-02 23:47:11','2019-07-02 23:47:11');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
