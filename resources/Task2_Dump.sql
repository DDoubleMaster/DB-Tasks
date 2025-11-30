CREATE DATABASE  IF NOT EXISTS `dse_lamps_dump` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dse_lamps_dump`;
-- MySQL dump 10.13  Distrib 9.4.0, for Win64 (x86_64)
--
-- Host: localhost    Database: dse_lamps_dump
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) DEFAULT NULL,
  `operation` varchar(20) DEFAULT NULL,
  `record_id` int DEFAULT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
INSERT INTO `audit_log` VALUES (1,'dse_lamp','update',1,'price=45.99','price=50.00','2025-11-29 17:14:55','root@localhost'),(2,'dse_lamp','update',2,'in_stock=10','in_stock=20','2025-11-29 17:14:55','root@localhost');
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dse_brand`
--

DROP TABLE IF EXISTS `dse_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dse_brand` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dse_brand`
--

LOCK TABLES `dse_brand` WRITE;
/*!40000 ALTER TABLE `dse_brand` DISABLE KEYS */;
INSERT INTO `dse_brand` VALUES (1,'LightPro','Germany'),(2,'BrightHome','USA'),(3,'EcoLamp','China'),(4,'NordicDesign','Sweden');
/*!40000 ALTER TABLE `dse_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dse_category`
--

DROP TABLE IF EXISTS `dse_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dse_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dse_category`
--

LOCK TABLES `dse_category` WRITE;
/*!40000 ALTER TABLE `dse_category` DISABLE KEYS */;
INSERT INTO `dse_category` VALUES (1,'Office'),(2,'Decorative'),(3,'Study'),(4,'Children');
/*!40000 ALTER TABLE `dse_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dse_lamp`
--

DROP TABLE IF EXISTS `dse_lamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dse_lamp` (
  `lamp_id` int NOT NULL AUTO_INCREMENT,
  `lamp_name` varchar(150) NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `material_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `in_stock` int DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `year_of_release` int GENERATED ALWAYS AS (cast(json_unquote(json_extract(`metadata`,_utf8mb4'$.year')) as unsigned)) STORED,
  PRIMARY KEY (`lamp_id`),
  KEY `brand_id` (`brand_id`),
  KEY `category_id` (`category_id`),
  KEY `material_id` (`material_id`),
  KEY `idx_year` (`year_of_release`),
  CONSTRAINT `dse_lamp_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `dse_brand` (`brand_id`),
  CONSTRAINT `dse_lamp_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `dse_category` (`category_id`),
  CONSTRAINT `dse_lamp_ibfk_3` FOREIGN KEY (`material_id`) REFERENCES `dse_material` (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dse_lamp`
--

LOCK TABLES `dse_lamp` WRITE;
/*!40000 ALTER TABLE `dse_lamp` DISABLE KEYS */;
INSERT INTO `dse_lamp` (`lamp_id`, `lamp_name`, `brand_id`, `category_id`, `material_id`, `price`, `in_stock`, `metadata`) VALUES (1,'Classic Desk Lamp',1,1,1,50.00,14,'{\"color_temp\": \"3000K\", \"power_watts\": 60, \"switch_type\": \"button\", \"warranty_months\": 24}'),(2,'Wooden Retro Lamp',4,2,2,71.60,20,'{\"style\": \"retro\", \"bulb_type\": \"E27\", \"material_finish\": \"oak\"}'),(3,'Eco Plastic Lamp',3,3,3,25.00,50,'{\"power_watts\": 15, \"eco_certified\": true, \"lifespan_hours\": 20000}'),(4,'Glass Study Lamp',2,3,4,48.00,15,'{\"year\": 2023, \"glass_type\": \"frosted\"}'),(5,'Children Night Lamp',3,4,3,18.75,30,'{\"theme\": \"cartoon\", \"age_group\": \"3-7\", \"safety_certified\": true}'),(6,'modern metal lamp',1,1,1,44.72,12,NULL);
/*!40000 ALTER TABLE `dse_lamp` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_lamp_insert` BEFORE INSERT ON `dse_lamp` FOR EACH ROW Begin
    If new.category_id = 4 then
        Set new.metadata = json_object(
            'theme', 'default',
            'safety_certified', true,
            'age_group', 'kids'
        );
    Elseif new.category_id = 1 then
        Set new.metadata = json_object(
            'power_watts', 40,
            'color_temp', '4000K'
        );
    End if;
End */;;
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_update_lamp` AFTER UPDATE ON `dse_lamp` FOR EACH ROW begin
    if new.price < 0 then
        signal sqlstate '45000'
        set message_text = 'цена не может быть отрицательной';
    end if;

    if old.price <> new.price then
        insert into audit_log(table_name, operation, record_id, old_value, new_value, changed_by)
        values ('dse_lamp', 'update', new.lamp_id,
                concat('price=', old.price),
                concat('price=', new.price),
                current_user());
    end if;

    if old.in_stock <> new.in_stock then
        insert into audit_log(table_name, operation, record_id, old_value, new_value, changed_by)
        values ('dse_lamp', 'update', new.lamp_id,
                concat('in_stock=', old.in_stock),
                concat('in_stock=', new.in_stock),
                current_user());
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `dse_lamp_brand`
--

DROP TABLE IF EXISTS `dse_lamp_brand`;
/*!50001 DROP VIEW IF EXISTS `dse_lamp_brand`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dse_lamp_brand` AS SELECT 
 1 AS `lamp_id`,
 1 AS `lamp_name`,
 1 AS `brand_name`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dse_lamp_brand_cat_mat`
--

DROP TABLE IF EXISTS `dse_lamp_brand_cat_mat`;
/*!50001 DROP VIEW IF EXISTS `dse_lamp_brand_cat_mat`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dse_lamp_brand_cat_mat` AS SELECT 
 1 AS `lamp_id`,
 1 AS `lamp_name`,
 1 AS `brand_name`,
 1 AS `category_name`,
 1 AS `material_name`,
 1 AS `price`,
 1 AS `in_stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dse_lamp_brand_category`
--

DROP TABLE IF EXISTS `dse_lamp_brand_category`;
/*!50001 DROP VIEW IF EXISTS `dse_lamp_brand_category`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dse_lamp_brand_category` AS SELECT 
 1 AS `lamp_id`,
 1 AS `lamp_name`,
 1 AS `brand_name`,
 1 AS `category_name`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `dse_material`
--

DROP TABLE IF EXISTS `dse_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dse_material` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `material_name` varchar(100) NOT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dse_material`
--

LOCK TABLES `dse_material` WRITE;
/*!40000 ALTER TABLE `dse_material` DISABLE KEYS */;
INSERT INTO `dse_material` VALUES (1,'Metal'),(2,'Wood'),(3,'Plastic'),(4,'Glass');
/*!40000 ALTER TABLE `dse_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dse_order`
--

DROP TABLE IF EXISTS `dse_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dse_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `lamp_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `lamp_id` (`lamp_id`),
  CONSTRAINT `dse_order_ibfk_1` FOREIGN KEY (`lamp_id`) REFERENCES `dse_lamp` (`lamp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dse_order`
--

LOCK TABLES `dse_order` WRITE;
/*!40000 ALTER TABLE `dse_order` DISABLE KEYS */;
INSERT INTO `dse_order` VALUES (1,1,2,'2025-11-01'),(2,2,1,'2025-11-02'),(3,3,5,'2025-11-03'),(4,4,3,'2025-11-04'),(5,5,4,'2025-11-05'),(6,6,2,'2025-11-06'),(7,1,1,'2025-11-07'),(8,2,2,'2025-11-08'),(9,3,1,'2025-11-09');
/*!40000 ALTER TABLE `dse_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dse_lamps_dump'
--

--
-- Dumping routines for database 'dse_lamps_dump'
--
/*!50003 DROP FUNCTION IF EXISTS `dse_total_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `dse_total_price`() RETURNS decimal(10,2)
    DETERMINISTIC
begin
    declare v_price decimal(10,2);
    declare v_total decimal(10,2) default 0.00;
    declare done int default 0;

    declare cur cursor for
        select price from dse_lamp;

    declare continue handler for not found set done = 1;

    open cur;
    read_loop: loop
        fetch cur into v_price;
        if done = 1 then
            leave read_loop;
        end if;

        set v_total = v_total + v_price;
    end loop;
    close cur;

    return v_total;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dse_update_stock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dse_update_stock`(in p_lamp_id int)
begin
    declare v_qty int;
    declare done int default 0;

    declare cur cursor for
        select quantity from dse_order where lamp_id = p_lamp_id;

    declare continue handler for not found set done = 1;

    open cur;
    read_loop: loop
        fetch cur into v_qty;
        if done = 1 then
            leave read_loop;
        end if;

        update dse_lamp
        set in_stock = in_stock - v_qty
        where lamp_id = p_lamp_id;
    end loop;
    close cur;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `dse_lamp_brand`
--

/*!50001 DROP VIEW IF EXISTS `dse_lamp_brand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dse_lamp_brand` AS select `l`.`lamp_id` AS `lamp_id`,`l`.`lamp_name` AS `lamp_name`,`b`.`brand_name` AS `brand_name`,`l`.`price` AS `price` from (`dse_lamp` `l` left join `dse_brand` `b` on((`l`.`brand_id` = `b`.`brand_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dse_lamp_brand_cat_mat`
--

/*!50001 DROP VIEW IF EXISTS `dse_lamp_brand_cat_mat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dse_lamp_brand_cat_mat` AS select `l`.`lamp_id` AS `lamp_id`,`l`.`lamp_name` AS `lamp_name`,`b`.`brand_name` AS `brand_name`,`c`.`category_name` AS `category_name`,`m`.`material_name` AS `material_name`,`l`.`price` AS `price`,`l`.`in_stock` AS `in_stock` from (((`dse_lamp` `l` left join `dse_brand` `b` on((`l`.`brand_id` = `b`.`brand_id`))) left join `dse_category` `c` on((`l`.`category_id` = `c`.`category_id`))) left join `dse_material` `m` on((`l`.`material_id` = `m`.`material_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dse_lamp_brand_category`
--

/*!50001 DROP VIEW IF EXISTS `dse_lamp_brand_category`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dse_lamp_brand_category` AS select `l`.`lamp_id` AS `lamp_id`,`l`.`lamp_name` AS `lamp_name`,`b`.`brand_name` AS `brand_name`,`c`.`category_name` AS `category_name`,(case when (`l`.`price` < 45) then 'small' else 'large' end) AS `price` from ((`dse_lamp` `l` left join `dse_brand` `b` on((`l`.`brand_id` = `b`.`brand_id`))) left join `dse_category` `c` on((`l`.`category_id` = `c`.`category_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-30 20:06:25
