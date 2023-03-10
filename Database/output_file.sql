-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: online_store
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (9,'Monitors','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕'),(10,'Computers, Laptops','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕'),(11,'Smartphones','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕'),(12,'Appliances','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕'),(13,'Instruments','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕'),(14,'Household Products','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕'),(15,'Plumbing and Repair tools','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕'),(16,'Clothes','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕'),(17,'Kids Toys','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕'),(18,'Pet supplies','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕'),(19,'Office, School, Books','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕'),(20,'Gaming Accessories','╨Ю╤Б╨╜╨╛╨▓╨╜╤Л╨╡ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕, ╤Б╤В╨╛╨╕╨╝╨╛╤Б╤В╤М ╨╕ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debug`
--

DROP TABLE IF EXISTS `debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debug` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debug`
--

LOCK TABLES `debug` WRITE;
/*!40000 ALTER TABLE `debug` DISABLE KEYS */;
INSERT INTO `debug` VALUES (1);
/*!40000 ALTER TABLE `debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,2,1,3000),(10,16,8,1,950),(11,16,9,1,950),(12,16,3,1,999),(35,29,8,7,950),(37,31,10,1,950),(38,31,8,1,950),(41,33,10,1,950),(42,33,8,1,950),(43,34,4,2,1057),(46,36,10,1,950);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `decrease_stock_trigger` AFTER INSERT ON `order_items` FOR EACH ROW BEGIN
  CALL decrease_stock(NEW.order_id, NEW.product_id, NEW.quantity, NEW.id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total` float DEFAULT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `order_date` (`order_date`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,6,1,'2023-02-13 18:52:31'),(7,6,1,'2023-02-13 19:35:22'),(8,6,1,'2023-02-13 19:36:44'),(9,6,1,'2023-02-13 19:38:18'),(10,6,3,'2023-02-13 19:50:07'),(11,6,3,'2023-02-13 19:51:06'),(12,6,3,'2023-02-13 19:51:21'),(13,6,3,'2023-02-13 19:52:30'),(14,6,3,'2023-02-13 19:54:07'),(15,6,3,'2023-02-13 19:54:21'),(16,6,3,'2023-02-13 19:55:25'),(17,6,1,'2023-02-13 19:56:04'),(29,6,1,'2023-02-13 20:33:00'),(31,27,2,'2023-02-15 16:48:42'),(33,27,2,'2023-02-15 16:50:28'),(34,27,1,'2023-02-15 16:50:49'),(36,28,1,'2023-02-18 21:59:03');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `price` float DEFAULT NULL,
  `rating` tinyint DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `stock` tinyint DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `name` (`name`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Lenovo Legion 7 Gen 6 (16\" AMD)','Crafted from aerospace-grade aluminum, untamed power lurks inside the Legion 7 Gen 6 (16\" AMD) gaming notebook. Equipped with the latest generation AMD processors and NVIDIA┬о GeForce RTXтДв graphics, this powerful notebook offers the AI optimization of the Lenovo Legion AI Engine Advanced cooling supports the highest possible resolution.',3500,4,'https://www.lenovo.com/medias/?context=bWFzdGVyfHJvb3R8OTI1MjF8aW1hZ2UvcG5nfGg3OC9oYWMvMTEzODQ1NDE2NDI3ODIucG5nfGNmYTQ4MjY1MDhkMTI5MzkyMGZjZGIyYjkwODBiNmUzNDE5ZmI0ZDg4ZWU4OTY1MWY2YjczYzcxMGEzY2U5MjQ',10,10),(2,'Razer Blade Pro 17','17.3\" Full HD 360Hz Intel i7-11800H 16GB RAM 1TB SSD GeForce RTX 3070 Windows 10',3000,5,'https://media.nbb-cdn.de/images/products/720000/728111/0406BGC3-01_26b6.jpg?size=2800',0,10),(3,'SAMSUNG Q70B (2022) 55 Zoll QLED 4K Smart TV','Enjoy cinematic images with the high-contrast Quantum HDR range. Experience compelling performance with the Quantum 4K processor. Enjoy gaming at 120Hz quality with an impressive moving image display. Ease of viewing with intelligent image adjustment in EyeComfort mode. Enjoy sound that can follow your movements with OTS Lite',999,5,'https://images.samsung.com/is/image/samsung/p6pim/uk/qe55q70batxxu/gallery/uk-qled-q70b-qe55q70batxxu-533175408?$1300_1038_PNG$',1,9),(4,'Victus by HP 16.1\"','Victus by HP 16.1\" FHD 144Hz R5-5600H 16GB/512GB SSD RTX 3060 DOS 16-e0457ng',1057,NULL,'https://im.cyberport.de/is/image/cyberport/210720133008200301900096G?$Zoom_1000$',0,10),(5,'Razer Viper Ultimate with charging station','Forget average and claim the unfair advantage with the Razer Viper Ultimate - a wireless gaming mouse built to win. This deadly predator was developed as a true extension of a player and features the most modern technology. It\'s ready to dig its fangs into the competition. The new, improved sensor features an industry-leading 20,000 DPI with a resolution accuracy of 99.6%, ensuring that even the finest movements of this wireless mouse are consistently tracked. Equipped with intelligent functions, the sensor becomes even more accurate and enables a high degree of precision for game-winning headshots. Using a beam of infrared light to register each click, this wireless mouse\'s switches are actuated with an industry-leading response time of 0.2 milliseconds. By eliminating the need for traditional physical contact, this form of actuation eliminates the need for a debounce delay and never triggers unintentional clicks, giving you more precise control and error-free execution. Enjoy faster, smoother control with the lightest wireless gaming mouse on the market. Weighing in at just 74g, it achieves its weight without sacrificing the build-proofness of its ambidextrous form factor. This form of actuation eliminates the need for a debounce delay and never triggers unintentional clicks, giving you more precise control and flawless execution. Enjoy faster, smoother control with the lightest wireless gaming mouse on the market. Weighing in at just 74g, it achieves its weight without sacrificing the build-proofness of its ambidextrous form factor. This form of actuation eliminates the need for a debounce delay and never triggers unintentional clicks, giving you more precise control and flawless execution. Enjoy faster, smoother control with the lightest wireless gaming mouse on the market. Weighing in at just 74g, it achieves its weight without sacrificing the build-proofness of its ambidextrous form factor.',130,5,'https://www.galaxus.at/im/Files/4/0/5/9/2/0/9/3/190381976_xxl3.jpg?impolicy=ProductTileImage&resizeWidth=648&resizeHeight=486&cropWidth=648&cropHeight=486&resizeType=downsize&quality=high',10,20),(6,'Logitech G Pro X Superlight Wireless Gaming Mouse','Less than 63 grams. Advanced low-latency LIGHTSPEED wireless. Sub-micron precision with HERO 25K sensor. Remove all obstacles with our lightest and fastest PRO mouse ever.',160,NULL,'https://resource.logitechg.com/w_692,c_limit,q_auto,f_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/pro-x-superlight/pro-x-superlight-white-gallery-1.png?v=1',10,20),(7,'SAMSUNG WW62J42E0HX/UA','Washing programs:тАВ 15-minute Quick Wash (Quick Wash), Bedding (Steam), Mixed Loads, Spin, Synthetics, Baby Care (Steam), Cotton, E Cotton, Rinse+Spin, Eco Wash (Super Eco Wash), Wool /delicate fabrics, drum cleaning Washing functions:тАВ Smart Check, foam soak, extra rinse, intensive wash, delayed start, prewash Features:тАВ water consumption (annual): 7300 l / energy: 122, temperature settings (тДГ): 95 -60-40-20-cold, number of rinses selection: 5-4-3-2-1-0, selection of spin programs (rpm): 1200-800-400-Rinse Hold, Volt Control system',455.3,5,'https://images.samsung.com/is/image/samsung/p6pim/ua/ww62j42e0hx-ua/gallery/ua-front-loading-washer-ww65j42e0hwdlp-314086-ww62j42e0hx-ua-532896214?$650_519_PNG$',10,12),(8,'Apple iPhone 14 256Gb Midnight (MPVV3) eSIM','iPhone 14 is a new product from Apple, which was presented to us at the autumn presentation of 2022. The smartphone remained in the familiar and convenient iPhone 14 form factor: the same square design with a diagonal arrangement of cameras, the usual bangs and a screen with a diagonal of 6.1 inches.',950,2,'https://ilounge.ua/files/products/apple-iphone-14-kupit.1000x.1000x.webp',0,11),(9,'Apple iPhone 14 256Gb Deep Purple (MPVV3) eSIM','iPhone 14 is a new product from Apple, which was presented to us at the autumn presentation of 2022. The smartphone remained in the familiar and convenient iPhone 14 form factor: the same square design with a diagonal arrangement of cameras, the usual bangs and a screen with a diagonal of 6.1 inches.',950,5,'https://cdn0.ispace.am/AfrOrF3gWeDA6VOlDG4TzxMv39O7MXnF4CXpKUwGqRM/resize:fill:540/bg:f6f6f6/q:100/plain/s3://catalog-products/220908083552340064/221010160030013906.png@webp',9,11),(10,'Apple iPhone 14 256Gb Purple (MPVV3) eSIM','iPhone 14 is a new product from Apple, which was presented to us at the autumn presentation of 2022. The smartphone remained in the familiar and convenient iPhone 14 form factor: the same square design with a diagonal arrangement of cameras, the usual bangs and a screen with a diagonal of 6.1 inches.',950,NULL,'https://cdek.shopping/storage/products/apple-iphone-14-fiol/apple-iphone-14-tftztmtz-tztm-1.jpg',7,11),(11,'Sofa Atlantic corner','The Atlantic sofa will captivate you at first sight with its luxurious appearance. It looks presentable and expensive, and also allows you to demonstrate the excellent taste of the owner of the house. Thanks to its angular design, this model will successfully fit into any room. Stylish, and at the same time laconic design goes well with various interior solutions. Also, the Atlantic sofa is decorated with decorative stitching, which emphasizes its sophistication.',550,NULL,'https://divan.com.ua/image/cache/wp/gj/data/crocus/atlantik/atlantic-main-311x200.webp',10,14),(12,'Apple iPhone 13 128GB (Midnight)','It seems that it can be better than the flagship twelve, equipped with advanced technologies in the field of mobile development. And yet, the creators from Cupertino each time manage to surprise users with new products with a particularly stylish design and innovative filling. You fall in love with the hot Apple iPhone 13 at first sight. Sleek body features, new colors, an amazing display, cameras that rival the best in photography, powerful processors and a fast operating system. These are no longer just smartphones, but works of high-tech art.',750,NULL,'https://www.galaxus.at/im/Files/7/0/0/0/5/4/5/9/iPhone_13_Midnight_PDP_Image_Position-1A__WWEN.jpg?impolicy=ProductTileImage&resizeWidth=648&resizeHeight=486&cropWidth=648&cropHeight=486&resizeType=downsize&quality=high',10,11),(13,'Apple iPhone 13 128GB (Red)','It seems that it can be better than the flagship twelve, equipped with advanced technologies in the field of mobile development. And yet, the creators from Cupertino each time manage to surprise users with new products with a particularly stylish design and innovative filling. You fall in love with the hot Apple iPhone 13 at first sight. Sleek body features, new colors, an amazing display, cameras that rival the best in photography, powerful processors and a fast operating system. These are no longer just smartphones, but works of high-tech art.',750,NULL,'https://www.galaxus.at/im/Files/4/8/8/9/0/9/7/1/iPhone_13_ProductRED_PDP_Image_Position-1A__WWEN.jpg?impolicy=ProductTileImage&resizeWidth=648&resizeHeight=486&cropWidth=648&cropHeight=486&resizeType=downsize&quality=high',10,11),(14,'Apple iPhone 13 128GB (Blue)','It seems that it can be better than the flagship twelve, equipped with advanced technologies in the field of mobile development. And yet, the creators from Cupertino each time manage to surprise users with new products with a particularly stylish design and innovative filling. You fall in love with the hot Apple iPhone 13 at first sight. Sleek body features, new colors, an amazing display, cameras that rival the best in photography, powerful processors and a fast operating system. These are no longer just smartphones, but works of high-tech art.',750,NULL,'https://www.galaxus.at/im/Files/4/8/8/9/0/9/8/8/iPhone_13_Blue_PDP_Image_Position-1A__WWEN.jpg?impolicy=ProductTileImage&resizeWidth=648&resizeHeight=486&cropWidth=648&cropHeight=486&resizeType=downsize&quality=high',10,11),(15,'Apple iPhone 13 128GB (Green)','It seems that it can be better than the flagship twelve, equipped with advanced technologies in the field of mobile development. And yet, the creators from Cupertino each time manage to surprise users with new products with a particularly stylish design and innovative filling. You fall in love with the hot Apple iPhone 13 at first sight. Sleek body features, new colors, an amazing display, cameras that rival the best in photography, powerful processors and a fast operating system. These are no longer just smartphones, but works of high-tech art.',750,NULL,'https://www.galaxus.at/im/Files/5/9/5/1/7/5/4/9/iPhone_13_Green_PDP_Image_Position-1A__WWEN.jpg?impolicy=ProductTileImage&resizeWidth=648&resizeHeight=486&cropWidth=648&cropHeight=486&resizeType=downsize&quality=high',10,11),(16,'Apple iPhone 13 128GB (Pink)','It seems that it can be better than the flagship twelve, equipped with advanced technologies in the field of mobile development. And yet, the creators from Cupertino each time manage to surprise users with new products with a particularly stylish design and innovative filling. You fall in love with the hot Apple iPhone 13 at first sight. Sleek body features, new colors, an amazing display, cameras that rival the best in photography, powerful processors and a fast operating system. These are no longer just smartphones, but works of high-tech art.',750,NULL,'https://www.galaxus.at/im/Files/4/8/8/9/0/9/0/1/iPhone_13_Pink_PDP_Image_Position-1A__WWEN.jpg?impolicy=ProductTileImage&resizeWidth=648&resizeHeight=486&cropWidth=648&cropHeight=486&resizeType=downsize&quality=high',10,11),(17,'Apple iPhone 14 128GB (Star-Light)','It seems that it can be better than the flagship twelve, equipped with advanced technologies in the field of mobile development. And yet, the creators from Cupertino each time manage to surprise users with new products with a particularly stylish design and innovative filling. You fall in love with the hot Apple iPhone 14 at first sight. Sleek body features, new colors, an amazing display, cameras that rival the best in photography, powerful processors and a fast operating system. These are no longer just smartphones, but works of high-tech art.',850,NULL,'https://www.galaxus.at/im/Files/4/8/8/9/0/7/9/9/iPhone_13_Starlight_PDP_Image_Position-1A__WWEN.jpg?impolicy=ProductTileImage&resizeWidth=648&resizeHeight=486&cropWidth=648&cropHeight=486&resizeType=downsize&quality=high',10,11),(18,'Xiaomi 12 Pro 5G (Gray)','The Xiaomi 12 Pro is equipped with a state-of-the-art triple camera array, including a 50 MP main camera with Sony IMX707 ultra large sensor, a 50 MP ultra wide-angle camera and a 50 MP telephoto camera. Adopting 2.44╬╝m 4-in-1 pixel combination technology, the main camera system improves the light-capturing ability by 120% compared to the previous Xiaomi 11 generation. To complement the impressive hardware, the device is also equipped with Xiaomi\'s advanced AI algorithm for a variety of scenarios to enable professional special effects and creative options, including Xiaomi ProFocus, Oneclick AI Cinema, etc. Meanwhile, Ultra Night excels video through low-light videography, with various portrait modes that allow the user to',900,NULL,'https://www.galaxus.at/im/Files/6/0/7/7/3/4/4/9/Xiaomi-12-Pro_Gray_1.jpg?impolicy=ProductTileImage&resizeWidth=648&resizeHeight=486&cropWidth=648&cropHeight=486&resizeType=downsize&quality=high',10,11),(19,'Xiaomi 12 Pro 5G (Puprle)','The Xiaomi 12 Pro is equipped with a state-of-the-art triple camera array, including a 50 MP main camera with Sony IMX707 ultra large sensor, a 50 MP ultra wide-angle camera and a 50 MP telephoto camera. Adopting 2.44╬╝m 4-in-1 pixel combination technology, the main camera system improves the light-capturing ability by 120% compared to the previous Xiaomi 11 generation. To complement the impressive hardware, the device is also equipped with Xiaomi\'s advanced AI algorithm for a variety of scenarios to enable professional special effects and creative options, including Xiaomi ProFocus, Oneclick AI Cinema, etc. Meanwhile, Ultra Night excels video through low-light videography, with various portrait modes.',900,NULL,'https://www.galaxus.at/im/Files/6/0/7/7/0/4/6/3/Xiaomi-12-Pro_Purple_1.jpg?impolicy=ProductTileImage&resizeWidth=648&resizeHeight=486&cropWidth=648&cropHeight=486&resizeType=downsize&quality=high',10,11),(20,'Cotton jacket with GG jacquard','First used in the 1970s, the GG logo was an evolution of the original Gucci diamond design from the 1930s and has been a symbol of Gucci\'s heritage ever since. This tracksuit jacket with a retro shape goes beyond its sporty origins to a street style that is firmly rooted in the present.',1400,NULL,'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1659721545/496919_X9V05_4245_001_100_0000_Light-Jacke-aus-Baumwolle-mit-GGJacquard.jpg',5,16),(21,'adidas x Gucci mohair knit track pants','Part of the adidas x Gucci collection, these mohair joggers feature the Gucci Trefoil embroidery. In the joint collection from adidas and Gucci, the web meets the three white stripes, while the GG monogram meets the trefoil. With a nod to the 80s and 90s, the creative director combines emblematic motifs of the house with the famous hallmarks of the sports label adidas, creating a new series of hybrid looks.',1500,NULL,'https://media.gucci.com/style/HEXE0E8E5_Center_0_0_800x800/1662157852/713024_XKCMO_9791_001_100_0000_Light-adidas-x-Gucci-Jogginghose-aus-Mohairstrick.jpg',5,16);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `review` text,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (3,7,1,3,'shit','2023-01-27 16:57:40'),(4,9,3,4,'shit','2023-01-27 20:16:56'),(6,7,3,5,'shit','2023-01-27 20:24:23'),(7,5,3,5,'shit','2023-01-27 20:24:46'),(8,11,3,5,'shit','2023-01-31 21:49:17'),(9,11,1,5,'shit','2023-01-31 21:50:58'),(40,27,5,5,'Nice++','2023-02-18 22:07:20'),(54,6,8,2,'sdadas','2023-02-18 16:47:35'),(55,6,9,5,'dsaads','2023-02-18 16:48:08'),(56,6,7,5,'dsaads','2023-02-18 16:49:43'),(57,6,2,5,'test','2023-02-21 16:15:13'),(58,28,3,5,'test','2023-02-18 22:01:11');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prevent_duplicate_reviews` BEFORE INSERT ON `reviews` FOR EACH ROW BEGIN
    DECLARE review_exists INT;
    SET review_exists = (SELECT COUNT(*) FROM reviews WHERE user_id = NEW.user_id AND product_id = NEW.product_id);
    IF review_exists > 0 THEN
        SIGNAL SQLSTATE '42927'
        SET MESSAGE_TEXT = 'A review for this product by this user already exists.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_product_rating` AFTER INSERT ON `reviews` FOR EACH ROW BEGIN
    UPDATE products 
    SET rating = (SELECT AVG(reviews.rating) FROM reviews WHERE reviews.product_id = NEW.product_id)
    WHERE id = NEW.product_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_product_rating_after_deleting` AFTER DELETE ON `reviews` FOR EACH ROW BEGIN
    DECLARE avg_rating INT;
    SET avg_rating = (
        SELECT AVG(rating) FROM reviews WHERE product_id = OLD.product_id
    );
    UPDATE products SET rating = avg_rating WHERE id = OLD.product_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJWYXN5YTEwMTNAZ21haWwuY29tIiwiaWF0IjoxNjcyMTU1NDA4fQ.eMi82ULIVL-v3xsSl4N-1BykXPE1AQsj_iToFKURbG8',4,'2023-01-03 15:36:48'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZW1haWwiOiJWYXN5YTEwMTRAZ21haWwuY29tIiwiaWF0IjoxNjcyMTY1Mjg2fQ.FkxG2S417rqQbHt-xXPI7h0BpjeOtNcPcM3AvbVQK1M',5,'2023-01-03 18:21:26'),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZW1haWwiOiJWYXN5YTEwMTRAZ21haWwuY29tIiwiaWF0IjoxNjcyMTY1NjE0fQ.hpC-pocYeLiNn9DFuVcTqFto3Q2tSyKMQRTUTQ2zrIM',5,'2023-01-03 18:26:55'),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJpYXQiOjE2NzIzMjA0MDl9.KhVbxzM4woIeDboK1uwkQLIKXbq41YGugkjnBP2fIxA',6,'2023-01-05 13:26:49'),(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MjMyMDUxM30.4Rjhza7ncbnsaZt29fqI8qkXlZ9-PgQGDJbE4Bngbkw',6,'2023-01-05 13:28:33'),(6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MjMyMDU2OH0.s_3f4x9U3QFmyJxcU5-u9dQmwPnct0us4wjn0wR6sds',6,'2023-01-05 13:29:28'),(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiZW1haWwiOiJWYXN5YTEwMTVAZ21haWwuY29tIiwicm9sZUlkIjoxLCJpYXQiOjE2NzI0MTkxMDh9.2JBzXgBInDj9t_941NPMRW6YdNyeBYo1mqxcJ6W99b0',7,'2023-01-06 16:51:49'),(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiZW1haWwiOiJWYXN5YTEwMTVAZ21haWwuY29tIiwicm9sZUlkIjoyLCJpYXQiOjE2NzI0MTk1Nzl9.E9urEzcLATQqJ2ZoH8_p5O6haQlWox27Dei0tkm2AIM',7,'2023-01-06 16:59:39'),(9,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiZW1haWwiOiJWYXN5YTEwMTVAZ21haWwuY29tIiwicm9sZUlkIjoyLCJpYXQiOjE2NzI0MTk1ODB9._GdA_d2bLJ6slcGqGufppF-kq7RLnhDwx4ulUhGaMQg',7,'2023-01-06 16:59:41'),(10,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiZW1haWwiOiJWYXN5YTEwMTVAZ21haWwuY29tIiwicm9sZUlkIjoyLCJpYXQiOjE2NzI0MTk1ODF9.8fTOJBFmJc3lm11DFpz_DLqfG0ZZczRp03IkA1sMgN4',7,'2023-01-06 16:59:42'),(11,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiZW1haWwiOiJWYXN5YTEwMTVAZ21haWwuY29tIiwicm9sZUlkIjoyLCJpYXQiOjE2NzI0MjQwMzJ9.KN4pT00V2knV_L1nPr0aQfvdNhvGeg6XtJg1KSXYdu8',7,'2023-01-06 18:13:53'),(12,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MjQyNDA3NH0.f39837Kj3n7j3WWhIOPzUflwxG6MSNoGy84z9Lawt_8',6,'2023-01-06 18:14:35'),(13,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MjQyNDA4NH0.NmYM4ega_Ly3p0j_r0RMsc1DJh7f7ytVA8WwFPUumes',6,'2023-01-06 18:14:44'),(14,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MjQyNDIwNH0.8LNMy7GYoJmIzeovRHNB-ucO2nT2yrX8OnwkODWWfsQ',6,'2023-01-06 18:16:44'),(15,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MjQyNDIwNX0.I0Jy8pcReoTqTEeW80RyfHXDkIs8m2tX1H8A7MSDIU4',6,'2023-01-06 18:16:45'),(16,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MjQyNDIwNn0.gQWY2aJjt2r7WEKrR0Tn3td085YSN_djaLEFVPloxyQ',6,'2023-01-06 18:16:47'),(17,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MjQyNDM5Mn0.2kTY2VpmTTb_1waKZogkfMdoefuCXgM-2UvKSaIlTvk',6,'2023-01-06 18:19:52'),(18,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImVtYWlsIjoiVmFzeWExMDIzMUBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3MjQzMDU3OX0.DPmz21rAv_eg_ObBwIwBu7wasyBBgngD3hmJ5qH2Dsc',11,'2023-01-06 20:03:00'),(19,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MjQzMDg0M30.Uz3vBRmcU8stYOCwJYstqCz-MMDlktFyV2W950s6aRY',6,'2023-01-06 20:07:24'),(20,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcxMDc4OH0.gxUrSfwaHK9KWUktPz_kQGzAn1yRK9D5k5q-KVVF7KM',6,'2023-01-21 15:39:48'),(21,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcxNzM3NH0.eU6R3LuV975erRpZhDEIR-rECfBUXEwVpEN7Y22ashs',6,'2023-01-21 17:29:35'),(22,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyMTU2Mn0.4rT2YuGTBjH4YsiU5oPeImicgcw69Q0-qo-WusFDDdU',6,'2023-01-21 18:39:22'),(23,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyMjAxNX0.XxOBX650xDwvF8oLLegv8IwgpdBFVlm4ZM09TTUdtvY',6,'2023-01-21 18:46:56'),(24,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyMjA5NH0.OUYdZeZfq7OYqGkgfNjyZWaXn4LlPtPxelnllkzzN9U',6,'2023-01-21 18:48:15'),(25,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyMjE4Mn0.LLm4yEpa2KcwEwbY6R9xoO4ciZoIp9vauoFSBjkpY6U',6,'2023-01-21 18:49:42'),(26,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyMjI0N30.P-OAB0UofYKcI1FrBnMWIWWD7m3DzwtZASHuRR56-7E',6,'2023-01-21 18:50:47'),(27,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyMjI5Nn0.1XIn2Qt0WbLHWPV_Qu8hqrBCSs48Q_QqoGztVaOHZLY',6,'2023-01-21 18:51:37'),(28,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyMjUxMX0.bmuTjjpuujN8zRoSsj8S1XhYHFeGBlxq7QuCaIbfKdA',6,'2023-01-21 18:55:12'),(29,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyMzA1NH0.hyPJ2Jd0bFcqTEjmR8pmnMYekSA86EpBL3IB7wm0bQ4',6,'2023-01-21 19:04:14'),(30,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyNTAwMX0.YaC1XKjvWd5a64r8uqqCwfVowyvgPN8DUlt3eRV9Taw',6,'2023-01-21 19:36:42'),(31,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyNTQ3NX0.vAlJiK6SlopWg6MPD-gZVFv9C9SnFhGphKXexVbisRc',6,'2023-01-21 19:44:36'),(32,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyNTUzNn0.9wtDdQ-RK7Tq2yHuEyP-v4yXNVke6Ys37LE6Bb2ZIvw',6,'2023-01-21 19:45:37'),(33,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyNTU5OX0.8lebqq3MI6eM-lypgJRw6VarBF8i3xtRhKhp0yJW_n0',6,'2023-01-21 19:46:39'),(34,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyNTY4N30.XpKqHtteuR3JSQvjPAbXvl9DcATiP3C1PdlUSrGQPiY',6,'2023-01-21 19:48:07'),(35,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzcyODM3MH0.1DxZOIp0iS5YwoYbsdPVQvuwZm4ZfN3GbRSdWYYzdLo',6,'2023-01-21 20:32:50'),(36,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzczMDc5Nn0.e5RgwmPCudU4UTpB6zTgljtGilj7OTwPaS0BGRVJ1Hc',6,'2023-01-21 21:13:17'),(37,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTksImVtYWlsIjoiQ2h1YmVua28ubG94MjAwMkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3Mzc0MjMwN30.fUhFwY5VlJqFJkI5kuvVkjBaE9K5Lg9TjwYXt-4Ypbw',19,'2023-01-22 00:25:07'),(38,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzc3NTY2OX0.hCEo8SMUtSGZuxoG_5tYd6IPpagq03TUbBGoPOAGbKs',6,'2023-01-22 09:41:10'),(39,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzc3NTczNH0.HYqXuYM3IWhz-3TAY27rItZvkP3M1vFEmjDfrSIs0M0',6,'2023-01-22 09:42:15'),(40,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzc3NTk0OX0.xWlpjcTlAfbQgubZuKAMKeDppWWtvih8x1nvOt3hqUo',6,'2023-01-22 09:45:49'),(41,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzc3OTA5MX0.-qRunrWwqEHt_txPCeUn4BjxtSrX_l-9ZxSP-jQONBw',6,'2023-01-22 10:38:11'),(42,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzc3OTczNX0.aRRypLzpCiD5MRrkKk37HoPHfCyb9bhfx8GwcgAkoEk',6,'2023-01-22 10:48:55'),(43,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzc4MjUxOX0.oPTLcrkrKk3IKIoF4P_CCAr-nrlPEecKcGilox4jBzo',6,'2023-01-22 11:35:20'),(44,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzc4NzMwNH0.oxRzqDqpqNdEiW4xKBwAMaIRffQLguPXmbVl99qR3Tk',6,'2023-01-22 12:55:05'),(45,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzc4NzM0MH0.1Oe3ayso6IByaRVcde0_Q-WIxc7F5lHlGlckVytjYcM',6,'2023-01-22 12:55:41'),(46,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzc4NzQzM30.WwcUf_G94lmnhbXnKtUQoAVhkA3aEhVWUif9w6LF8q8',6,'2023-01-22 12:57:13'),(47,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzg5MDkyMX0.f1jqSwLYaArDYykjtn3nMkDHnKGOOj9mh3ul5ZzBias',6,'2023-01-23 17:42:01'),(48,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzg5MTAzMn0.bBrdnDkeejcEo4BM_0GX_9XnXJlMjwjQ7OtoVo295HQ',6,'2023-01-23 17:43:52'),(49,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Mzg5MTc5OX0.5eeLrpkLMj3CFFOQkgVnrBYJBsl_w10Lmy_Q_6NE8z0',6,'2023-01-23 17:56:39'),(50,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzkwMjIyOH0.apWZJUJb8X8B6radeghxDlHM95gvqOkQsAxpb6AdWAM',6,'2023-01-23 20:50:29'),(51,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3MzkwMjMwOX0.FCT1DW3Pln2FiZMstLmjA1UbPmVw60MSdv1xvfTLB-E',6,'2023-01-23 20:51:49'),(52,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDA1OTc3OH0.ZJBuLbmSYFmSpZ1kxwJnd8wglTxS7oZLEZOHZxEfJ0M',6,'2023-01-25 16:36:19'),(53,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDA2NjExOX0.YS9l_F22BbqjHHoWcfS3ddDg8fZMg19XKbCDb8_IkxY',6,'2023-01-25 18:21:59'),(54,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDA3MDA4M30.RGSlmmEEqzjdh23e348EERZ5651QjuBwUryGXFyy4OE',20,'2023-01-25 19:28:03'),(55,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDA3MDE4NH0.9baPmDiMhw9pBas_oMSrWNLJ6mSX3Ky2rZ90kS-FXYg',6,'2023-01-25 19:29:45'),(56,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDA3MDM3MH0.pkXd42QzUP5Eb4lMQRsl3csctwFBrIV9ttA68hcQox8',20,'2023-01-25 19:32:50'),(57,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDA3MDQ2OH0.EZuuB_yaElycwCbjP2G1Dv46R18UaSiEiRo0YYyLQTI',6,'2023-01-25 19:34:28'),(58,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDA3MDUwMX0.pdW6-27hgjpgRUB7Ws_32cTz4ZIzwBtA9d9HviUbF_w',20,'2023-01-25 19:35:02'),(59,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDA3MDYwOX0.cqYkfClCgTYg7sSJ0iUnDg_2ylL711o8eMXnFJ1KACM',6,'2023-01-25 19:36:49'),(60,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDA3MDgzMn0.jiInWKyGmrQN-keQIu1TMeCZ-00ygBzSJd-5ld0OKhs',20,'2023-01-25 19:40:32'),(61,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDA3MjM0Mn0.u7aGhX-sK2YblveNZhIuSezlVyC3x2fEWRVq9TtRUnU',6,'2023-01-25 20:05:43'),(62,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDA3MzYwNn0.3ehDzqYIogtwAmvuFPHyRuFKJZiEei2KmCZZWmx6Lqc',20,'2023-01-25 20:26:47'),(63,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDA3MzY4M30.zF9HJd3aF1oID0gqKpIOH2o69XqMFjC5wzwbrTYpUes',6,'2023-01-25 20:28:03'),(64,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDA3Mzc2MH0.kwZu4SRchPI2IOU1ZukqXRuwQIq1K7nZ75v9QrdcZHc',20,'2023-01-25 20:29:20'),(65,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDA3Mzc5Mn0.cuduJc95PeOR1ly9wavENyznAhxdh2IKOT7SvKWrdPw',6,'2023-01-25 20:29:52'),(66,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDA3Mzg3N30.8xbv0JSU0nkBHwf_6YLe9dH0q17Jm27DqrWorMQamiA',20,'2023-01-25 20:31:17'),(67,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDA3MzkyOX0.0ZIp0KUPi_UkG_H8JeARNMS32Z7wUhrA2f4PUbGD5ks',6,'2023-01-25 20:32:09'),(68,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDMyMDE5N30.S6Bo77Piw6877SU1s8ZNJ5_Iv65iOHiNnaQ3y9Bqtb8',20,'2023-01-28 16:56:38'),(69,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDMyMDIxNn0.rTInGMYzgjzBcvZDOpH6snZy_Xpt_gKtALNa5CVMQv8',6,'2023-01-28 16:56:56'),(70,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDMyMDI2MH0.fXphTrKOlMmgb2hr5g3kZErHQkNv0X5dKeErd-hmQ-s',20,'2023-01-28 16:57:40'),(71,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDMyMDI3Nn0.EDpzUH2iiKIVg_PGcPD0d_iZQMOHmUOrDMayHhIdNm0',6,'2023-01-28 16:57:56'),(72,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDMyMjUwNH0.mqYqbNSNwnWhI2JxJxw7MXbQ1SkDtfK_KTkhgTfR4qE',6,'2023-01-28 17:35:04'),(73,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDM0MDExM30.LsQNO8uG7yr5Uo6OZW1rks7dltFbipGEzL3ajWESDkk',20,'2023-01-28 22:28:34'),(74,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDM0MDM2Nn0.L6tK89QC7MauZX4Rw6EtQ0HUUSJzZ55z7gaBXGEtRjc',20,'2023-01-28 22:32:46'),(75,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDM0MTI4NH0.9tWNZzIG3th0NzQYnYnNE4-ZNXwXO7iFp3_CozWklUQ',6,'2023-01-28 22:48:05'),(76,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDM4MDYyMX0.jxwurNZi4fE2IBmzjY9F0UWR6S4HZ7laxQi74KkEuP0',6,'2023-01-29 09:43:42'),(77,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NDM4OTAyM30.NvLAor0cDdL_SIGXMBbq5rWpRax5OTJCtoxPo8zudqs',20,'2023-01-29 12:03:44'),(78,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDM4OTA2OX0.VmDPHUb5kbNhn2PXT682HT2vWzsVcm6WFogsPNOeynI',6,'2023-01-29 12:04:29'),(79,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDM5MDg3M30.N7KLZPz5-g0YWitA__ZAtGCw_cpoIUPoZg4wots4yxw',6,'2023-01-29 12:34:33'),(80,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDM5MzgzM30.Th8XzbBlADrYB78uMzV8fh8denttZ1Ctz1bz1n6A-mQ',6,'2023-01-29 13:23:53'),(81,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDQ3NzkzMX0.szqi2kCEw9mMI3YNHPhgNw6K2UYHRl5wNxiQvk9wbbE',6,'2023-01-30 12:45:31'),(82,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NDQ4Nzk1OX0.Qfro5RZ7wFa-DzkQXSozmoikn9mMJHDBfxHBU_UYsb4',6,'2023-01-30 15:32:39'),(83,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsImVtYWlsIjoibG9scjIyMjRAZ21haWwuY29tIiwicm9sZUlkIjoyLCJpYXQiOjE2NzQ0ODg3NjN9.whDg0sRz-t96Uf5VtLMmYQszmc_dCG3B-dUfmaVSYBg',21,'2023-01-30 15:46:03'),(84,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NTIwMjEwNX0.9EJP0prZUOq3384WYs4VCInSjnkccebaoBhbXzDSnag',20,'2023-02-07 21:55:05'),(85,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjMsImVtYWlsIjoidGVzdDExQGdtYWlsLmNvbSIsInJvbGVJZCI6MiwiaWF0IjoxNjc1MjkzOTEwfQ.OZTr9Loa07Nuhns13BWQdnt3fRmVZ4DqK_yfm2CmJEQ',23,'2023-02-08 23:25:11'),(86,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTI5Mzk5OH0.H0Kqg8P8Pn2BP4PBjCDUlUcO18JpkJ_Ih3t6lZNWM_A',6,'2023-02-08 23:26:39'),(87,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTI5NDEzNn0.T5ck_L2A4BxhXHbpOGPgL-0hAgvdD56-5R_6yua_rr8',6,'2023-02-08 23:28:56'),(88,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTI5NDEzN30.P8czQpZvlUV-3_sjrmDxGbdkPkYi2TZt2G2SiUfgVOc',6,'2023-02-08 23:28:57'),(89,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTI5NDMwN30.9rR6WymqyxtFj1Ab-4vv4omvMiI8pV1h-fxZ4F2jups',6,'2023-02-08 23:31:48'),(90,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTcwMTg2Mn0.pF-vOsqIcyQFgw7dN04b5REv-Z6lbCgDK4CujUKplbc',6,'2023-02-13 16:44:23'),(91,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTg4NTgxOH0.v1zeuGHn4gd_grwQw1z6oVh2FJtnxrk5tsrkCnu94Uc',6,'2023-02-15 19:50:18'),(92,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTg4NTkxMX0.LB9zMWWCLHAdqzTYTaaIw8jHp4fPq5aQl3Lw6uUs-54',6,'2023-02-15 19:51:52'),(93,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTg4NTk5MH0.g2H0gf75qn3lqsumZLUeA49cKrNbPyEDpwygVaLctBY',6,'2023-02-15 19:53:10'),(94,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsImVtYWlsIjoiZGlhYWFuYWFhYWExNkBnbWFpbC5jb20iLCJyb2xlSWQiOjIsImlhdCI6MTY3NTg4NjAyMX0.szoiwPHmMB6cPZMzddQbxOl_KlA6dAvcE9P6-CrHvgQ',20,'2023-02-15 19:53:41'),(95,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTk2MDU2OX0.kw0FYJ1z9KfAuZkukzgTbhEVk11GOJwYdUXZzGhtWU4',6,'2023-02-16 16:36:09'),(96,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzU5NjA2Mzl9.PAmsXMBFLGwk8tW0D6IQ4_lMwfAggqiRVI2bu9K_qmw',24,'2023-02-16 16:37:19'),(97,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzU5NjA3MTZ9.x9KWyExjw8j-4ivW7OogMi4zejXYmVtBjWTn9RrZz5E',24,'2023-02-16 16:38:37'),(98,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzU5NjA3ODV9.XcFcohjWC9Lg7TVPXmHU1kuj4OPs3gXamp10qz05li0',24,'2023-02-16 16:39:45'),(99,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzU5NjA5Nzl9.ef8nkmAjrPnCw6zPTpxf-hJvUa7Ho2G60xjVpRz_ZjY',24,'2023-02-16 16:42:59'),(100,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzU5NjEwMDR9.RPneJs_5DINONTIp72_26qwSPVQaV8RDGb--4QKT4Ao',24,'2023-02-16 16:43:25'),(101,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzU5NjEwNTZ9.6tTMVQZD-37NtLhlV-HlfrLgeHDcYL6OM6rX9Smx-nc',24,'2023-02-16 16:44:16'),(102,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTk2MTc4OX0.JdgGRWpEhoHrVaajlNM9M49ZUAphKzIRarjllNlAV9g',6,'2023-02-16 16:56:29'),(103,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzU5NjY4NDh9.2WxdhvaHiNK0l2pjzgJkbzWHi-1Pl2nRr6zZNqauiKU',24,'2023-02-16 18:20:48'),(104,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzU5NjcxMjR9.bzKaELZkFELVT5aAHTO9fgmxz4ZPxRUIamSqPvtqbxg',24,'2023-02-16 18:25:24'),(105,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzU5NjcyNjF9.praa7SNVHV02vpVBH2GEfzDy7Pqi_JOMOMpy2JK3kpE',24,'2023-02-16 18:27:41'),(106,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTk3MzA5Mn0.fyYHtEBVflu3iXiJmspHULMFJWi20qwhB74fGjRFM4M',6,'2023-02-16 20:04:52'),(107,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTk3MzUzNH0.wjSJqK4goDvn4KFOEzWUT-R9ziO5hejJ1wHE--RO0Zg',6,'2023-02-16 20:12:15'),(108,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NTk3NDg5NH0.jeYbQjODaMeDme4xy_L4GrWxmByap6poheauk8EpOyQ',6,'2023-02-16 20:34:55'),(109,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjA1ODE2MX0.E9ROVnlp9E6JJec1Shb9SIqWefH05ot7W3r8yThSgPU',6,'2023-02-17 19:42:41'),(110,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjA1OTM2OH0.pDl6N72A_FEQesxnEUI9U3twTQHIaC7ITyUkD0R74Lg',6,'2023-02-17 20:02:49'),(111,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzYwNTk3OTF9.q1H2BCuTfxLt6RF_djfOmTWQzFPENs7WhriTBBwYkko',24,'2023-02-17 20:09:52'),(112,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjA1OTg3Nn0.MP2M4fp9iq9DrqzQ_mmWuTkJ8p7h-WijgGCp6pGIBVc',6,'2023-02-17 20:11:16'),(113,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjA2MDcwMX0.91-XHiaeuYzURbWQwaTZy_3pwdLagQi112iSsNnoEec',6,'2023-02-17 20:25:01'),(114,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjIwMzExOH0.sGIJzwPXHJ_0gmv74F6LF2W0Gzc1_kzSLiBaAQ_uQXA',6,'2023-02-19 11:58:38'),(115,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzYyMjI3NjJ9.YZz7Z9KCXcRZyXNHAfvWeKZxl9QsVLqEYbjxEHvSl20',24,'2023-02-19 17:26:03'),(116,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjIyMjc3OX0.cSVCg1fnMpe0WbynGeLyFPBZwOUePBI9L4WhP0OpLCM',6,'2023-02-19 17:26:19'),(117,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjIyMjgyNH0.xxRpM6dzQ-3LKn9cxVHyD6h0qYHGUsTAe5SaqHh_Z5g',6,'2023-02-19 17:27:04'),(118,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsImVtYWlsIjoibEBsIiwicm9sZUlkIjoyLCJpYXQiOjE2NzYyMjQ4MDd9.CJP-QYnbXofBLolGdC8t2mhqAda9NdtZWrXaXHrAJCE',24,'2023-02-19 18:00:08'),(119,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjIyNDg0NX0.QkdhVxkL-yUyevnDUalDDA2-QQYkqQchX6wC3ozSyE4',6,'2023-02-19 18:00:45'),(120,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjIyOTYzOX0.XUhzb_iEj04UbxBj4kWfUDhVpY8i3xnvvNZZHvzXfX0',6,'2023-02-19 19:20:40'),(121,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjIyOTY5MX0.3u-n--ByVimFYkDTx11IF1jQEfKu2rdcD7YLlZpyO5c',6,'2023-02-19 19:21:31'),(122,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjI5MDcwNH0.f7dUkw3KGp_b31KXURvyxlgD7Vc_n4U1IMlm-Tr1Urg',6,'2023-02-20 12:18:24'),(123,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImVtYWlsIjoiVmxhZDMxQGdtYWlsLmNvbSIsInJvbGVJZCI6MiwiaWF0IjoxNjc2Mjk4NDI4fQ.ixDpANHcvXqzC9PmXz6hWEFr47TRIq2WbD8qUg_r9os',26,'2023-02-20 14:27:08'),(124,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsImVtYWlsIjoiVmxhZDMxQGdtYWlsLmNvbSIsInJvbGVJZCI6MiwiaWF0IjoxNjc2Mjk4NDYzfQ.UV4UO8bxUZLEhGC_YYwntO5WMmRH-iTuGkuKbOjM0p8',26,'2023-02-20 14:27:44'),(125,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjI5OTAxN30.aT30MUHDzxf88BQcAZZ-OtRoIFc4oWyUjKRomxDDyN4',6,'2023-02-20 14:36:57'),(126,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY0Nzk1Nzh9.HeeK3rnmkZEHe1QR5k0o9eM0_ASdenna7lvpeqL7Vug',27,'2023-02-22 16:46:19'),(127,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjQ3OTg3MX0.JaGH5r3eI-ZtaS_R4LufxXNS9mlLlsf8HhsowkKeEkw',6,'2023-02-22 16:51:12'),(128,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY0ODAyNTR9.RZtKGndgx9nri-rzK7N66hh_pw1i3QYyu1TLOJ0vtzo',27,'2023-02-22 16:57:34'),(129,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY2NDc3Mjl9.RwGfPIbBylU-YAsgOQ50-oFfy4D7ZqXbpoWgTraGmvA',27,'2023-02-24 15:28:50'),(130,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjY2MDYzMH0.dBVoZSKrKADMfGvhbefET3XnRuSYC47zi-AW7wMNS44',6,'2023-02-24 19:03:50'),(131,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjczNzczMH0.ezk8RU5WOMfRf9j1AFkcEJUqcokZtdwTz6sFvHmV3Z4',6,'2023-02-25 16:28:51'),(132,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY3NTA1OTV9.njeH_prH_875nvSYCKaXnmXGjuPD6lRyXyTe4FCXXN4',27,'2023-02-25 20:03:16'),(133,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njc1MTIyOX0.jhQUFgkc75PWguODG7aQsF0bd5s04-egLjO8EeACWd4',6,'2023-02-25 20:13:50'),(134,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njc1Mzc3Nn0.v-9g2YCPqI7XQ7LvW2anqZux355I-ouGsrr4hdTC8kc',6,'2023-02-25 20:56:17'),(135,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njc1Mzg0OH0.sXcZwtPWLVwjqmB7lla9lx7fFtkJ3WunyPsf5kjq4V0',6,'2023-02-25 20:57:29'),(136,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njc1MzkxOH0.uQ-_wIB8_j7hxPtuhcko2Lso8tcDBGDF7oJp_LMzH2Y',6,'2023-02-25 20:58:38'),(137,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njc1NTQ4NX0.kbJw3fh4PFizgd3Mzi62kyg02_gGqFdFp4d1r6UVo54',6,'2023-02-25 21:24:46'),(138,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njc1NTk3MH0.Ig8TxT-SWbjv3cL3WxbLP558M2rYQyMOempoVPIEc7s',6,'2023-02-25 21:32:50'),(139,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njc1NjIwNn0.GVloSkhHi7ci5wdQisnmUaCIMiwnRQIcDiQteDzb-IA',6,'2023-02-25 21:36:47'),(140,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsImVtYWlsIjoiSEBoLmNvbSIsInJvbGVJZCI6MiwiaWF0IjoxNjc2NzU3NDgzfQ.dSWsZ6X_m7DkZCPBB7DQSuRZweogps5JuJwPaVr18nU',28,'2023-02-25 21:58:04'),(141,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njc1NzcwMX0.Tn_MTG03gGpoISB-Cgcm_7KNMAMyMndsmi4gLT9mk8c',6,'2023-02-25 22:01:41'),(142,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjgwNjUwOX0.iBWkKQrXS3lFnzt0GtbCFjCSLiC501IXem2jjC678Co',6,'2023-02-26 11:35:10'),(143,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjgwOTYzM30.8X0_wspjNAxguj_KKHnRw-piXdwakJ4APogoi4k8laY',6,'2023-02-26 12:27:14'),(144,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY4MTMyNDJ9.zEg_CVyaOtSfzG4apFzfaGMY04Fsc8jycWN-a6uObFE',27,'2023-02-26 13:27:23'),(145,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY4MTM5MjJ9.8M0hsDF9Rr72ctM0eFCqpamuUHFKYnEmEAc5XoRtqX0',27,'2023-02-26 13:38:42'),(146,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY4MTQwNjN9.V75E7jb4oJ-RXgqzPhv2kGr___b457HSzMO43SmJk0Q',27,'2023-02-26 13:41:04'),(147,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY4MTQwOTN9.ozz1sF85WZr55_LSOi5tF7pu0k1oca-gnPxZpK-Oqxc',27,'2023-02-26 13:41:33'),(148,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY4MTQxMzV9.M3hXEVIq2rR4-b0uZBaMW08YFn1w9oZiOe9OJ4COlNA',27,'2023-02-26 13:42:15'),(149,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjgxNDIzMn0.mYOT8wUHlSp8UXLGdMVmiM4YKBlTVrD6mAXkPDLTJD0',6,'2023-02-26 13:43:52'),(150,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY4MTQyNzJ9.exnN4wbSe4f8a6Qx3tdtuWl5-xcUYr3SM8HdSJLourw',27,'2023-02-26 13:44:32'),(151,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjgxNDM5NH0.uicyh_adNCFmIcbipmua-EMo0E-swX3PChexpIwhQB0',6,'2023-02-26 13:46:34'),(152,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY4MTQ0MTN9.Ph57PdAYQM8gS4DCLGVNcI7JaDc6Vb4_e_WPPQH2nCw',27,'2023-02-26 13:46:53'),(153,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjgxNDQyN30.2PmfFOUM9nvnTRVnQ_0KQ8GjSDahDfSQwe78W0FlngU',6,'2023-02-26 13:47:08'),(154,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY4MTQ1MTV9.kbZXIxKeVdDSDpDGWEIwA2ftKJna_svEUVi1m4Yx-co',27,'2023-02-26 13:48:35'),(155,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjgxNDU0MH0.5kV-vprcKu6aWwyonJg9hJrsLPvg105An9DnJ951DL8',6,'2023-02-26 13:49:01'),(156,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjgxNTYxMH0.X58kXCWPiwOp2LDvZLzBUMb1CNfWCOaGE7wABBDbE6k',6,'2023-02-26 14:06:50'),(157,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjgxNTcwMH0.2aUAdSgVxuXDeOuK8jITtgqVj_hPWXtL1UdPb99ntUM',6,'2023-02-26 14:08:20'),(158,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY4MTU3Mzl9.WAlzFFAGziHm_76t0sXoMoO04SRY2_ZAaVVblx5bq7E',27,'2023-02-26 14:09:00'),(159,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjgxNTc4Mn0.TdvyZP33bfL248oJ7d0krZJcxkEOc28HEKlrs3As0QI',6,'2023-02-26 14:09:43'),(160,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY4MTU4MDF9.WcANcSJ-WLhWx_BIB3xjpd1tNwDEHwga2vip91Tse10',27,'2023-02-26 14:10:02'),(161,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NjgxNTg2NH0.5mHwKBzK8KTS91fNpR6t021fXyRdcmxxE1bKzQTLwKE',6,'2023-02-26 14:11:04'),(162,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZ0BnIiwicm9sZUlkIjoyLCJpYXQiOjE2NzY4MTU5MzV9.hCXFAxJg9L7zU190vReZse6pOaem_jivKhVhXdyujSQ',27,'2023-02-26 14:12:15'),(163,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njk5Mzg4NH0.l6jT2v5saj538upZVfiMFpg7bRKdUQWLgCQysx1sOJI',6,'2023-02-28 15:38:05'),(164,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njk5Mzk0OX0.zVvUHzMkc7-4yZydvj_8fucNuXVPwHfZeFmabfSVqpQ',6,'2023-02-28 15:39:09'),(165,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njk5Mzk3NX0.YQzC55RBsNfJQDyFUC4yQXXeDOGmWDdk9NNb08cEvGs',6,'2023-02-28 15:39:35'),(166,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njk5NDY0OX0.iQG8kodKcgEF-7MZrm08QrkSPZXnFnxxISXMqmAhB5M',6,'2023-02-28 15:50:49'),(167,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njk5NzU1NX0.hVP_H3v17glX-4lhthByfFkPVhYpBSP8L3-rIy5IC_8',6,'2023-02-28 16:39:15'),(168,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3Njk5ODUzMn0.dp6zq6xjUyJiajuqEk2H0p7aSHhidG8j3UHisRGR3R4',6,'2023-02-28 16:55:32'),(169,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZW1haWwiOiJMb2xyMjIyM0BnbWFpbC5jb20iLCJyb2xlSWQiOjEsImlhdCI6MTY3NzAxMTczM30.vcgluMHr09_9vlRowVeUz3DbFMFPCGoxfub1Shcsrxk',6,'2023-02-28 20:35:34');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role_id` int DEFAULT NULL,
  `banned` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Vasya',18,'Vasya1013@gmail.com','$2b$10$GsyuiWuW3EIkkWdZH0JKGOcmYKDs0fmoslxtoN9RmGVWhDHFHJ3vq','Ukraine','Kharkiv','MS 1/2 61000',2,0),(5,'Vasya',18,'Vasya1014@gmail.com','$2b$10$0sZCbAv9nWj74IN5cWbx5.neyoelPE3XD./B5S6k2fnJL0s7D2aqO','Ukraine','Kharkiv','MS 1/2 61000',2,0),(6,'Tymur Khamzin',20,'Lolr2223@gmail.com','$2b$10$pMxSX0AJ04tlM2aNDxSM8uwXzjKjFSTaJMYTTGD3ynp3uP0SUZvBW','Ukraine','Kharkiv','Moscow prosp. 200/2',1,0),(7,'Tymur',18,'Vasya1015@gmail.com','$2b$10$0Kh/We593VPaFGPai/E1XuflUqb2ao/eficbF9Q0LYGOmtZvwAChO','Ukraine','Kharkiv','MS 1/2 61000',2,0),(9,'Tymur',18,'Vasya1011@gmail.com','$2b$10$iqD6aAcPnMzEE8dadjgHauqd/x7pWRra19sopLQG8qsge09vtFH4.','Ukraine','Kharkiv','MS 1/2 61000',2,0),(11,'Tymur',18,'Vasya10231@gmail.com','$2b$10$y4iz4pWIVcq7N8ue6J1Fy.oPyDtNyJ1JvGGedQx4s6a/Jtlw6UbzW','Ukraine','Kharkiv','MS 1/2 61000',2,0),(12,'Tymur',18,'Vasya102311@gmail.com','$2b$10$.YTDasHbx7.dXkd//NIekOto8PJWXP34hhXT6IfhOandg7owhVAPm','Ukraine','Kharkiv','MS 1/2 61000',2,0),(15,'Tymur Khamzin',18,'Lolr2229@gmail.com','$2b$10$tN.jlK4ezAUaNgdvDKRuEeu1W7XXCqqn/pVjGgU.QF8DnAWhZsFtS','Afghanistan','Test','1dsadasasdad',2,0),(16,'Tymur Khamzin',18,'Lolr22210@gmail.com','$2b$10$JnJTzjaYdpsHB59n0QQWyOzsVnN4AAzndmL19/k2HefBaTjkqpEfq','Afghanistan','Test','1dsadasasdad',2,0),(17,'╨▓╤Л╤Д ╨▓╤Л╤Д',19,'╨▓╤Л╤Д╨▓╤Д╤Л@das','$2b$10$/22mvQjgWQG72p51uvgCQOYgvu0C11Y5p8Wz0gllf5O1i64RgxqVu','Albania','╨▓╤Л╤Д','╨▓╤Л╤Д╨▓╤Л╤Д╨▓╤Л╤Д',2,0),(18,'dsadsa dsaads',19,'Lolr22211@gmail.com','$2b$10$pnck2Dz1kU04DyHkkOuaCuLMnDxX10THUF/mb8XdUYj9Cf.1rBZy2','Albania','dsadsadsa','dsadasdas',2,0),(19,'Andrey Chubenko',19,'Chubenko.lox2002@gmail.com','$2b$10$NbIWWZKlVBafb5ahrGQaTOjP1YCrbz9vCPlVJ3Uow6G6BFvFGrEYO','Ukraine','Kharkiv','Moscov Prospect 199/2',2,0),(20,'Diana Zhytenova',18,'diaaanaaaaa16@gmail.com','$2b$10$xFdmS7ksHap59ZAANK.RLe2PNpDc2J5wSrFSTv5TMOou/KG2amp/G','Ukraine','Kharkiv','Moscow Prospect 202/1',2,0),(21,'Tymur Khamzin',18,'lolr2224@gmail.com','$2b$10$zZUz0PnBc4h2UApLbQzJ0unSo6DKU1wdXXxdYnCcaI9RnXuyyzBSC','Ukraine','Kharkiv','╨Ь╨╛╤Б╨║╨╛╨▓╤Б╨║╨╕╨╣ ╨┐╤А╨╛╤Б╨┐╨╡╨║╤В 200/2 42',2,0),(22,'Oleksander Svishch',28,'Test12@gmail.com','$2b$10$TZJFuJmgtqFV2FyZnCxNHOKFkILvyliL80BzdelxqPwCPc49KH22i','Ukraine','Kharkiv','Ms 200/2 42',2,0),(23,'Oleksandr Svishch',28,'test11@gmail.com','$2b$10$.QB54o2v.Dq9r7J0a5pugOf.Hb//96y0GMb4Icgys5BAKHyxDbGcu','Ukraine','Kharkiv','test1dsadas',2,0),(24,'Tymur Khamzin',18,'l@l','$2b$10$qabsxxBf8/BYjVWCgUX5nefFJpQj3oPB6N6mSFrSY1yfEqAF2RYoS','Ukraine','Kharkiv','MS 1/2 61000',2,0),(25,'Tymur abubaba Jadsa',20,'Ld1@gmail.com','$2b$10$hmw0ij7Ijuu8ylXMt/SJUuEy16L/l253NPR7Zo5zv5sXK3nmeciTa','Ukraine','Kharkiv','dsadsaadsadsadsads',2,0),(26,'Vladislav Mormul',21,'Vlad31@gmail.com','$2b$10$DNMiC1cXmkvcbZNSrPrMKe1uLxf8SlsSYrj096NYRCF0nXWfEFKKW','Ukraine','Kharkiv','test1234',2,0),(27,'Ivan Shevchenko',20,'g@g','$2b$10$m/MH2SrTH6Fu3rmfk5WV9eflwHMrYHNnG4ztr7Qaom2QWbX67rlmm','Ukraine','Khakiv','test321312',2,1),(28,'Tymur Khamzin',18,'H@h.com','$2b$10$Wu8jmpQS4VjV9dxCcJkp5.DtczgBjRbU3Aw2fLfwTm9wwN76vSST6','Ukraine','Khrakiv','Moscov prospect 200/2',2,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-22 16:17:58
