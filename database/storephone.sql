-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: phone_sell
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acc_role_relationship`
--

DROP TABLE IF EXISTS `acc_role_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `acc_role_relationship` (
  `acc_id` int(11) NOT NULL,
  `acc_role_id` int(11) NOT NULL,
  KEY `FKsg4ai4lpnrnkamw2oqour5xha` (`acc_role_id`),
  KEY `FKnx5qy8hfguywr0qcniarcs1fu` (`acc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_role_relationship`
--

LOCK TABLES `acc_role_relationship` WRITE;
/*!40000 ALTER TABLE `acc_role_relationship` DISABLE KEYS */;
INSERT INTO `acc_role_relationship` VALUES (1,1),(2,1),(3,1),(4,2),(4,1),(5,1),(6,1),(7,1);
/*!40000 ALTER TABLE `acc_role_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q0uja26qgu1atulenwup9rxyr` (`email`),
  UNIQUE KEY `UK_f6xpj7h12wr185bqhfi1hqlbr` (`user_name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'quang nam','1999-01-20','dangnguyenvan.info@gmail.com','nguyen van dang','8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414','0823573189','ACTIVE','dang'),(7,'quang nam','2020-01-19','phamhang123499@gmail.com','hang','8bb0cf6eb9b17d0f7d22b456f121257dc1254e1f01665370476383ea776df414','0823573344','ACTIVE','hang');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_role`
--

DROP TABLE IF EXISTS `account_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_role`
--

LOCK TABLES `account_role` WRITE;
/*!40000 ALTER TABLE `account_role` DISABLE KEYS */;
INSERT INTO `account_role` VALUES (1,'ROLE_USER'),(2,'ROLE_ADMIN'),(3,'ROLE_SELLER');
/*!40000 ALTER TABLE `account_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'iPhone','iPhone'),(2,'Samsung','Samsung'),(3,'Oppo','Oppo');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsgsuxxoc1h5pskbjpch4id2ec` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Silver',1),(2,'Grey',1),(3,'Black',2),(4,'Grey',2),(5,'Black',3),(6,'Blue',3),(7,'Silver',4),(8,'Grey',4),(9,'Black',5),(10,'Pink',5),(11,'Black',6),(12,'white',6),(13,'Purple',7),(14,'Black',7),(15,'Black',8),(16,'Silver',8),(17,'Silver',9),(18,'Black',9),(19,'Grey',10),(20,'Yellow',10);
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_date` date NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp41h5al2ajp1q0u6ox3i68w61` (`account_id`),
  KEY `FKm1rmnfcvq5mk26li4lit88pc5` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'2020-06-30','good',1,1),(2,'2020-07-16','good',1,2),(3,'2020-07-21','good',1,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsskuoi6u8b6tykfj5jy1wng9r` (`account_id`),
  KEY `FKbg4txsew6x3gl6r9swcq190hg` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (2,1,1);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8sfun6tj1hqb85ed52o8mkqyh` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'ip11.png',1),(2,'ss.png',2),(3,'op.png',3),(4,'ipx.png',4),(5,'ip7pl.png',5),(6,'opA52.png',6),(7,'opA92.png',7),(8,'ssA71.png',8),(9,'ssnt10.png',9),(10,'ip8pl.png',10);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoit9ggxgcgl3cmp8jme73nl47` (`color_id`),
  KEY `FKrws2q0si6oyd6il8gqe2aennc` (`order_id`),
  KEY `FKb8bg2bkty0oksa3wiq5mp5qnc` (`product_id`),
  KEY `FKmsyu8a0aqlcfos3tx4c9bxv19` (`promotion_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,2,1,1,NULL),(2,1,7,2,4,NULL),(3,1,6,3,3,NULL),(4,1,5,4,3,NULL),(5,1,3,5,2,NULL),(6,1,3,6,2,NULL),(7,1,5,7,3,NULL),(8,1,1,8,1,1),(9,1,1,9,1,NULL),(10,1,2,9,1,NULL),(11,2,1,10,1,NULL),(12,1,3,10,2,NULL),(13,2,1,11,1,1),(14,1,1,12,1,NULL),(15,1,1,13,1,1),(17,1,1,15,1,1),(18,1,1,16,1,1),(19,1,1,17,1,1),(20,1,2,18,1,1),(21,1,3,19,2,NULL),(22,1,1,20,1,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `totalPrice` double NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `shipping_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3c7gbsfawn58r27cf5b2km72f` (`account_id`),
  KEY `FKsemahq4easllj6if07wtarony` (`shipping_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2020-07-12','PENDING',1270,NULL,1),(2,'2020-07-12','CANCELLED',1032,NULL,2),(3,'2020-07-12','CANCELLED',1032,1,3),(4,'2020-07-11','CANCELLED',1032,1,4),(5,'2020-07-13','PENDING',688,2,5),(6,'2020-07-14','PENDING',688,NULL,6),(7,'2020-07-14','PENDING',1032,NULL,7),(8,'2020-07-14','PENDING',1016,NULL,8),(9,'2020-07-14','CANCELLED',2540,1,9),(10,'2020-07-14','CANCELLED',3228,1,10),(11,'2020-07-15','CANCELLED',2032,NULL,11),(12,'2020-07-20','PENDING',1270,1,12),(13,'2020-07-21','CANCELLED',1016,NULL,13),(15,'2020-07-21','CANCELLED',1016,1,15),(16,'2020-07-21','CANCELLED',1016,1,16),(17,'2020-07-21','CANCELLED',1016,NULL,17),(18,'2020-07-21','PENDING',1016,1,18),(19,'2020-07-23','PENDING',688,NULL,19),(20,'2020-07-23','CANCELLED',1016,1,20);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `quantityInStore` int(11) NOT NULL,
  `ram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `battery_capacity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `front_camera` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rear_camera` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Smart Phone','iPhone 11 Pro Max 64GB',1270,100,'4GB','64GB','ACTIVE',1,'3046 mAh','12MP','3 camera 12 MP'),(2,'Smart Phone','Samsung Galaxy S20+',688,200,'8GB','128GB','ACTIVE',2,'4500 mAh','10MP','Chính 12 MP & Phụ 64 MP, 12 MP, TOF 3D'),(3,'Smart Phone',' OPPO Find X2..........             ',1032,300,'12GB','256GB','ACTIVE',3,'4200 mAh','32MP','Chính 48 MP & Phụ 13 MP, 12 MP'),(4,'Smart Phone','iPhone Xs Max 64GB ',1032,50,'4GB','64GB','ACTIVE',1,'3174 mAh','7MP','Chính 12 MP & Phụ 12 MP'),(5,'Smart Phone',' iPhone 7 Plus 32GB',452,30,'3Gb','32GB','ACTIVE',1,'2900 mAh','	7 MP','Chính 12 MP & Phụ 12 MP'),(6,'Smart Phone',' OPPO A52....................',258,60,'6 GB','128 GB','ACTIVE',3,'5000 mAh','16 MP','	Chính 12 MP & Phụ 8 MP, 2 MP, 2 MP'),(7,'Smart Phone','OPPO A92....................',279,40,'	8 GB','	128 GB','ACTIVE',3,'5000 mAh','16 MP','	Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP'),(8,'Smart Phone','Samsung Galaxy A71',361,80,'	8 GB','128 GB','ACTIVE',2,'	4500 mAh','32 MP','	Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP'),(9,'Smart Phone','Samsung Galaxy Note 10 Lite',430,70,'	8 GB','	128 GB','ACTIVE',2,'	4500 mAh','	32 MP','	Chính 12 MP & Phụ 12 MP, 12 MP'),(10,'Smart Phone','iPhone 8 Plus 128GB',689,90,'	3 GB','	128 GB','ACTIVE',1,'	2691 mAh','	7 MP','Chính 12 MP & Phụ 12 MP');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_promotion_relation`
--

DROP TABLE IF EXISTS `product_promotion_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_promotion_relation` (
  `promotion_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  KEY `FKqjnmhjmycnygfp5tn6l5naiqr` (`product_id`),
  KEY `FKe7io486udsyfyb81sjiqapf9w` (`promotion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_promotion_relation`
--

LOCK TABLES `product_promotion_relation` WRITE;
/*!40000 ALTER TABLE `product_promotion_relation` DISABLE KEYS */;
INSERT INTO `product_promotion_relation` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `product_promotion_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `end_date` date NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_tnm59112bh9o0828a4hotdubi` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'Sale Off 20% for iPhone 11 Pro Max 64GB',20,'2020-06-30','SALEOFF20','2020-06-28','ACTIVE'),(2,'Sale Off 10% for Samsung Galaxy S20+',10,'2020-06-30','SALEOFF10','2020-06-28','ACTIVE');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,'da nang','dangnguyenvan.info@gmail.com','dang','0823573189'),(2,'da nang','dangnguyenvan.info@gmail.com','dang','0823573189'),(3,'quang nam','dangnguyenvan.info@gmail.com','nguyen van dang','0823573189'),(4,'quang nam','dangnguyenvan.info@gmail.com','nguyen van dang','0823573189'),(5,'quang nam','phamhang123499@gmail.com','pham thi thuy hang','0823573344'),(6,'da nang','dangnguyenvan.info@gmail.com','dang','0823573189'),(7,'da nang','dangnguyenvan.info@gmail.com','dang','0823573189'),(8,'da nang','dangnguyenvan.info@gmail.com','dang','0823573189'),(9,'quang nam','dangnguyenvan.info@gmail.com','nguyen van dang','0823573189'),(10,'quang nam','dangnguyenvan.info@gmail.com','nguyen van dang','0823573189'),(11,'da nang','dangnguyenvan.info@gmail.com','dang','0823573189'),(12,'da nang','dangnguyenvan.info@gmail.com','nguyen van dang','0823573189'),(13,'da nang','dangnguyenvan.info@gmail.com','dang','0823573189'),(15,'quang nam','dangnguyenvan.info@gmail.com','nguyen van dang','0823573189'),(16,'quang nam','dangnguyenvan.info@gmail.com','nguyen van dang','0823573189'),(17,'da nang','dangnguyenvan.info@gmail.com','dang','0823573189'),(18,'quang nam','dangnguyenvan.info@gmail.com','nguyen van dang','0823573189'),(19,'da nang','dangnguyenvan.info@gmail.com','dang','0823573189'),(20,'quang nam','dangnguyenvan.info@gmail.com','nguyen van dang','0823573189');
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify`
--

DROP TABLE IF EXISTS `verify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_19kageuc65n23foq13vt3sacg` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify`
--

LOCK TABLES `verify` WRITE;
/*!40000 ALTER TABLE `verify` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'phone_sell'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-24 18:29:39
