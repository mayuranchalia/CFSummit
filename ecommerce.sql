-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: e-commerce
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand_table`
--

DROP TABLE IF EXISTS `brand_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand_table` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_description` varchar(1000) DEFAULT NULL,
  `brand_name` varchar(45) NOT NULL,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand_name_UNIQUE` (`brand_name`),
  UNIQUE KEY `brand_id_UNIQUE` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_table`
--

LOCK TABLES `brand_table` WRITE;
/*!40000 ALTER TABLE `brand_table` DISABLE KEYS */;
INSERT INTO `brand_table` VALUES (1,'Motorla brand is owned by Lenovo','Motorola'),(2,'HP laptops give you the right speed, graphics, and storage choices to match your lifestyle plus exclusive HP innovations to make the road enjoyable for you. This brand has some of the best-looking laptops in their portfolio','HP'),(3,'Lenovo Laptops are known for the perfect blend of uber cool design along with the right infusion of outstanding features to give you the best of performance. Be it the latest computer games to enjoy or intricate programming that needs to done','Lenovo'),(4,'MacBooks are renowned for their stability, easy-to-use interface and incredible looks. Whether it\'s for use at home, office, on the move or enjoying a film, they can do it all in style. They are perfect for almost everyone','Apple'),(5,'Yet again, Microsoft offers a range of robust devices that are not only feature-rich but also affordable and stylish. If you are looking for the perfect balance of size, power, elegance and affordability for working on the go, then the Surface range of tablets are for you','Microsoft'),(6,'If you are looking for a Mobiles at a reasonable price, then the honor Bee fits the bill well.The honor Brand Store has listings of different honor Mobiless in different colours. ','Huawei'),(7,'GE offers a wide range of large appliances such as refrigerators, washing machines, air conditioners, dishwashers, microwaves and water purifiers','GE'),(9,'A trusted choice of professionals, Canon produces cameras of the best quality. If you want a camera that gives you the best shots in all kinds of conditions, Canon is one of the good choices to consider.','Canon'),(10,'Nikon cameras are some of the best selling cameras in the world. The pictures captured by these cameras are of professional grade. With high quality flashes and lenses, a Nikon camera is worth purchasing.','Nikon');
/*!40000 ALTER TABLE `brand_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_table`
--

DROP TABLE IF EXISTS `category_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_table` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  `category_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_table`
--

LOCK TABLES `category_table` WRITE;
/*!40000 ALTER TABLE `category_table` DISABLE KEYS */;
INSERT INTO `category_table` VALUES (1,'Mobile & Tablets','These are electronic products'),(2,'Cameras','Range of SLR and DSLR cameras from top brands'),(3,'Computer & Laptops','Best performace computer with various price ranges and offers'),(4,'Large Appliances','a wide range of large appliances such as refrigerators, washing machines, air conditioners, dishwashers, microwaves and water purifiers from leading brands');
/*!40000 ALTER TABLE `category_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateway_table`
--

DROP TABLE IF EXISTS `gateway_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gateway_table` (
  `gateway_id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_name` varchar(45) DEFAULT NULL,
  `gateway_description` varchar(100) DEFAULT NULL,
  `gateway_settings` mediumtext COMMENT 'Settings specifying the configuration required to work with the gateway.',
  `gateway_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`gateway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateway_table`
--

LOCK TABLES `gateway_table` WRITE;
/*!40000 ALTER TABLE `gateway_table` DISABLE KEYS */;
INSERT INTO `gateway_table` VALUES (1,'alipay-express','This is Ali Pay express gateway','{url:https://www.alipay.com/21312131}','active'),(2,'directebanking','This Direct Banking gateway','{url:https://www.directbanking.com/232112423}','active'),(3,'paypal-express','This is paypal express gateway','{url://https://www.paypal.com/express/13231231}','active');
/*!40000 ALTER TABLE `gateway_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_product_table`
--

DROP TABLE IF EXISTS `merchant_product_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_product_table` (
  `merchant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  PRIMARY KEY (`merchant_id`,`product_id`),
  KEY `product_id_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_product_table`
--

LOCK TABLES `merchant_product_table` WRITE;
/*!40000 ALTER TABLE `merchant_product_table` DISABLE KEYS */;
--INSERT INTO `merchant_product_table` VALUES (1,1,15,800),(1,4,200,340),(2,2,39,500);
INSERT INTO `merchant_product_table` (`merchant_id`,`product_id`,`product_quantity`,`product_price`) VALUES (1,1,15,800);
INSERT INTO `merchant_product_table` (`merchant_id`,`product_id`,`product_quantity`,`product_price`) VALUES (1,4,200,340);
INSERT INTO `merchant_product_table` (`merchant_id`,`product_id`,`product_quantity`,`product_price`) VALUES (2,2,39,500);
INSERT INTO `merchant_product_table` (`merchant_id`,`product_id`,`product_quantity`,`product_price`) VALUES (10,12,1200,100);
INSERT INTO `merchant_product_table` (`merchant_id`,`product_id`,`product_quantity`,`product_price`) VALUES (10,13,100,95);
INSERT INTO `merchant_product_table` (`merchant_id`,`product_id`,`product_quantity`,`product_price`) VALUES (10,14,1000,125);
INSERT INTO `merchant_product_table` (`merchant_id`,`product_id`,`product_quantity`,`product_price`) VALUES (10,15,12000,54);
INSERT INTO `merchant_product_table` (`merchant_id`,`product_id`,`product_quantity`,`product_price`) VALUES (10,16,120,234);
INSERT INTO `merchant_product_table` (`merchant_id`,`product_id`,`product_quantity`,`product_price`) VALUES (10,17,126,120);
INSERT INTO `merchant_product_table` (`merchant_id`,`product_id`,`product_quantity`,`product_price`) VALUES (10,18,1200,129);
INSERT INTO `merchant_product_table` (`merchant_id`,`product_id`,`product_quantity`,`product_price`) VALUES (10,19,123,256);
/*!40000 ALTER TABLE `merchant_product_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_table` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_customer_id` varchar(60) NOT NULL,
  `order_status` varchar(15) NOT NULL,
  `order_products` varchar(100) NOT NULL COMMENT 'This should contain json string representing product_id and quantity',
  `order_amount` varchar(45) DEFAULT NULL,
  `order_payment_gatewayid` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `order_customer_id_idx` (`order_customer_id`),
  KEY `oreder_payment_gatewayid_idx` (`order_payment_gatewayid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES (1,'FA290252-A1F3-8697-CDC9EDB372E746ED','cart','[{\"PRODUCT_MERCHANT_ID\":1,\"QUANTITY\":3,\"PRODUCT_ID\":2}]',NULL,1),(5,'FA290252-A1F3-8697-CDC9EDB372E746ED','payment_pending','NT_ID\":2,\"QUANTITY\":1,\"PRODUCT_ID\":2}',NULL,2);
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_table`
--

DROP TABLE IF EXISTS `product_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_table` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(60) NOT NULL,
  `product_description` varchar(200) DEFAULT NULL,
  `product_brand_id` int(11) DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_image_links` mediumtext COMMENT 'This should contain comma seprated image links',
  `product_color` mediumtext,
  PRIMARY KEY (`product_id`),
  KEY `product_brand_id_idx` (`product_brand_id`),
  KEY `product_category_id_idx` (`product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_table`
--

LOCK TABLES `product_table` WRITE;
/*!40000 ALTER TABLE `product_table` DISABLE KEYS */;
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (1,'Iphone6c','Latest phone by Apple',4,1,'www.cdn.com/iphone6s,www.cdn.com/small/iphone6s','Black,Grey,Gold');
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (2,'Nexus6p','Latest phone by Google and Huawei',6,1,'www.cdn.com/nexus6p,www.cdn.com/small/nexus6p','Black,White');
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (3,'HP 14-AM081TU','2.3GHz Intel Core i5-6200U processor,4GB DDR4 memory is upgradable to 16GB,14-inch screen',2,3,'www.cdn.com/HP14-AM081TU,www.cdn.com/small/HP14-AM081TU','Black,Grey');
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (4,'HP 15-ac122tu','2GHz Intel Core i3 5005U 5th Gen Pocessor,4GB DDR3 RAM,15.6-inch screen',2,3,'www.cdn.com/HP15-ac122tu,www.cdn.com/small/HP15-ac122tu','Black,Red,Blue');
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (5,'HP 14-AC171TU','2GHz Intel Core i3-5005U 5th Gen Processor,4GB DDR3L RAM,14-inch screen',2,3,'www.cdn.com/HP14-AC171TU,www.cdn.com/small/HP14-AC171TU','White,Grey');
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (6,'Canon EOS 1300D','18MP APS-C CMOS sensor and DIGIC 4+,9-point AF with 1 center cross-type AF point,Standard ISO: 100 to 6400, expandable to 12800',9,2,'www.cdn.com/CanonEOS1300D,www.cdn.com/small/CanonEOS1300D','Black');
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (7,'Canon EOS 1200D','18 megapixel CMOS (APS-C) image sensor,High-performance DIGIC 4 image processor,ISO 100-6400 (expandable to H: 12800) to shoot from bright to dim light',9,2,'www.cdn.com/CanonEOS1200D,www.cdn.com/small/CanonEOS1200D','Black');
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (8,'Nikon D3300','24.2 megapixel effective sensor without an optical low-pass filter,Full-colour RGB metering sensor,Nikon\'s scene recognition system',10,2,'www.cdn.com/NikonD3300,www.cdn.com/small/NikonD3300 ','Black,Red');
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (9,'Nikon D5200','Equipped with a 24.1 megapixel DX-format sensor,Powered with EXPEED 3 engine,Sensitivity range from ISO 100 to ISO 6400 and the best in class 39 point AF system',10,2,'www.cdn.com/NikonD5200,www.cdn.com/small/NikonD5200','Black,Red');
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (11,'Apple5c','Apple 5c phone',4,1,'www.cdn.com/iphone5c,www.cdn.com/small/iphone5c',NULL);
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (12,'Red Shades','Cool Red Plastic Shades sunglasses isolated on white',12,5,'http://localhost:8500/images/red_shades.jpg',NULL);
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (13,'Sun Glasses (Shaded)','Sun Glasses Shaded on WHite',12,5,'http://localhost:8500/images/shaded_glasses.jpg',NULL);
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (14,'Purple Shades Ray ban','Purple Shades with Anti Glare',12,5,'http://localhost:8500/images/purple_shades.jpg',NULL);
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (15,'Brown Shades Gucci','Brown Shades',12,5,'http://localhost:8500/images/brown_shades.jpg',NULL);
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (16,'Geeky Shades','Geeky Shades',12,5,'http://localhost:8500/images/nerd_shades.jpg',NULL);
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (17,'Royal Shades','Royal Shades (Bronze Coated)',12,5,'http://localhost:8500/images/royal_shades.jpg',NULL);
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (18,'Funky Shades','Funky Shades with Sparkled Coating',12,5,'http://localhost:8500/images/funky_shades.jpg',NULL);
INSERT INTO `product_table` (`product_id`,`product_name`,`product_description`,`product_brand_id`,`product_category_id`,`product_image_links`,`product_color`) VALUES (19,'casual Shades','casual Shades to look casual',12,5,'http://localhost:8500/images/casual_shades.jpg',NULL);
/*!40000 ALTER TABLE `product_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_table`
--

DROP TABLE IF EXISTS `promotion_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_table` (
  `promotion_id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_type` varchar(100) DEFAULT NULL,
  `promotion_description` varchar(100) DEFAULT NULL,
  `promotion_status` varchar(10) DEFAULT NULL,
  `promotion_rule` varchar(45) DEFAULT NULL COMMENT 'This field will be brand_id, category_id, product_id or others',
  `promotion_discount_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_table`
--

LOCK TABLES `promotion_table` WRITE;
/*!40000 ALTER TABLE `promotion_table` DISABLE KEYS */;
INSERT INTO `promotion_table` VALUES (1,'free_ship','One electronics product shipping is free','active','product_category','88D06B7D-DB69-12F4-AB507B67FF8B2820');
/*!40000 ALTER TABLE `promotion_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_mapping`
--

DROP TABLE IF EXISTS `role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_mapping` (
  `user_id` varchar(45) NOT NULL,
  `user_role_id` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`,`user_role_id`),
  KEY `user_role_id_idx` (`user_role_id`),
  CONSTRAINT `user_role_id` FOREIGN KEY (`user_role_id`) REFERENCES `e-commerce`.`user_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_mapping`
--

LOCK TABLES `role_mapping` WRITE;
/*!40000 ALTER TABLE `role_mapping` DISABLE KEYS */;
INSERT INTO `role_mapping` VALUES ('awdhesh','1'),('mayur','1'),('paul','1'),('pawan','1'),('rick','1'),('han','2'),('john','2');
/*!40000 ALTER TABLE `role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `role_id` varchar(10) NOT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('1','customer'),('2','storeadmin');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_table` (
  `user_id` varchar(60) NOT NULL,
  `username` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `user_group` varchar(45) DEFAULT NULL COMMENT 'Group to which the customer belongs, like customer, merchant,sales, partner',
  `password` varchar(100) NOT NULL,
  `emailid` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `address` mediumtext NOT NULL COMMENT 'This should contain json string representing address fields',
  `created_at` date DEFAULT NULL,
  `user_history` mediumtext COMMENT 'Json array containing list of orders placed by this customer',
  `user_updated_at` date DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `customer_id_UNIQUE` (`user_id`),
  UNIQUE KEY `customer_emailid_UNIQUE` (`emailid`),
  UNIQUE KEY `customer_mobile_UNIQUE` (`mobile`),
  UNIQUE KEY `customer_username_UNIQUE` (`username`),
  CONSTRAINT `user_id` FOREIGN KEY (`username`) REFERENCES `e-commerce`.`role_mapping` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES ('CB803DA3-C35F-3D57-5A55D0AFBE659F50 ','adam','Adam','Gilchrist','merchant','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','adam@cfsummit.com','984294292329','NewYork',NULL,NULL,NULL),('FA2BCC97-E596-81AF-0C9BAC08175B83E6','awdhesh','Awdhesh','Kumar','consumer','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','awd@cfsummit.com','3449450490','Bangalore',NULL,NULL,NULL),('CB7321D4-FAB7-3CEE-9B6B6D589CF08AE4 ','gary','Gary','Kristen','merchant','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','gary@cfsummit.com','5034560433453','Los Angles',NULL,NULL,NULL),('51B1596F-0470-6197-4DF7C4A3459D42CD ','han','Han','Solo','storeadmin','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','han@cfsummit.com','695646467946','San Jose',NULL,NULL,NULL),('51A2C36C-FA3D-1A93-4F62B5F11E0FF099 ','john','John','Mathew','storeadmin','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','john@cfsummit.com','75692423345','San Jose',NULL,NULL,NULL),('FA290252-A1F3-8697-CDC9EDB372E746ED','mayur','Mayur','Jain','consumer','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','mjain@adobe.com','9986182719','Bangalore',NULL,NULL,NULL),('FA2CE150-D189-C2C4-4B1DE5AEF132FCFF','paul','Paul','Nibin','consumer','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','paul@cfsummit.com','43834958839','NewYork',NULL,NULL,NULL),('FA2A97DF-0001-CD23-37D97C4972596F90','pawan','Pavan','Venkata','consumer','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','pavan@cfsummit.com','999823443','Bangalore',NULL,NULL,NULL),('FA2E228E-DAE5-C86D-5DEAA8FAEEB5D153','rick','Rick','Harris','consumer','EBD77B2880DE6CEF4830A23C8DD8670D991B4D0FB018CBBD99187E5B846268DC','rick@cfsummit.com','93498483334','Las Vegas',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-20 16:44:02
