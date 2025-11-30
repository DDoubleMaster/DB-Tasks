CREATE TABLE `dse_brand` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `dse_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `dse_lamp` (
  `lamp_id` int NOT NULL AUTO_INCREMENT,
  `lamp_name` varchar(150) NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `material_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `in_stock` int DEFAULT NULL,
  PRIMARY KEY (`lamp_id`),
  KEY `brand_id` (`brand_id`),
  KEY `category_id` (`category_id`),
  KEY `material_id` (`material_id`),
  CONSTRAINT `dse_lamp_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `dse_brand` (`brand_id`),
  CONSTRAINT `dse_lamp_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `dse_category` (`category_id`),
  CONSTRAINT `dse_lamp_ibfk_3` FOREIGN KEY (`material_id`) REFERENCES `dse_material` (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `dse_material` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `material_name` varchar(100) NOT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `dse_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `lamp_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `lamp_id` (`lamp_id`),
  CONSTRAINT `dse_order_ibfk_1` FOREIGN KEY (`lamp_id`) REFERENCES `dse_lamp` (`lamp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `dse_brand` WRITE;
INSERT INTO `dse_brand` VALUES (1,'LightPro','Germany'),(2,'BrightHome','USA'),(3,'EcoLamp','China'),(4,'NordicDesign','Sweden');
LOCK TABLES `dse_category` WRITE;
INSERT INTO `dse_category` VALUES (1,'Office'),(2,'Decorative'),(3,'Study'),(4,'Children');
LOCK TABLES `dse_lamp` WRITE;
INSERT INTO `dse_lamp` VALUES (1,'Classic Desk Lamp',1,1,1,45.99,14),(2,'Wooden Retro Lamp',4,2,2,71.60,10),(3,'Eco Plastic Lamp',3,3,3,25.00,50),(4,'Glass Study Lamp',2,3,4,48.00,15),(5,'Children Night Lamp',3,4,3,18.75,30),(6,'modern metal lamp',1,1,1,44.72,12);
LOCK TABLES `dse_material` WRITE;
INSERT INTO `dse_material` VALUES (1,'Metal'),(2,'Wood'),(3,'Plastic'),(4,'Glass');
UNLOCK TABLES;
LOCK TABLES `dse_order` WRITE;
INSERT INTO `dse_order` VALUES (1,1,2,'2025-11-01'),(2,2,1,'2025-11-02'),(3,3,5,'2025-11-03'),(4,4,3,'2025-11-04'),(5,5,4,'2025-11-05'),(6,6,2,'2025-11-06'),(7,1,1,'2025-11-07'),(8,2,2,'2025-11-08'),(9,3,1,'2025-11-09');
UNLOCK TABLES;