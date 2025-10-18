```SQL
CREATE DATABASE IF NOT EXISTS `dse_disks`; -- Эту команду запускать отдельно
USE `dse_disks`; -- Эту тоже отдельно
  
DROP TABLE IF EXISTS `dse_disk_1`;
CREATE TABLE `dse_disk_1` (
  `disk_id` int NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(80) DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `selling_price` decimal(10,2) DEFAULT NULL,
  `firm_id` int DEFAULT NULL,
  `tdisk_id` int DEFAULT NULL,
  `disk_count` int DEFAULT NULL,
  PRIMARY KEY (`disk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `dse_disk_1` 
  (disk_id, disk_name, purchase_price, selling_price, firm_id, tdisk_id, disk_count)
VALUES
  (1,'Офис 2019',1.5,2.4,1,2,1),
  (2,'Linux Mint',1.7,2.4,2,1,1),
  (3,'Gold English',2.0,2.4,3,4,1),
  (4,'All Stars disco',1.5,2.4,4,3,4),
  (5,'1С-Предприятие',1.7,2.4,2,2,1);

DROP TABLE IF EXISTS `dse_firm_2`;
CREATE TABLE `dse_firm_2` (
  `firm_id` int NOT NULL AUTO_INCREMENT,
  `firm_name` varchar(40) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `agent_tel_fax` varchar(20) DEFAULT NULL,
  `director_tel_fax` varchar(20) DEFAULT NULL,
  `agent_name` varchar(40) DEFAULT NULL,
  `director_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`firm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `dse_firm_2` 
  (firm_id, firm_name, city_id, agent_tel_fax, director_tel_fax, agent_name, director_name)
VALUES
  (1,'Партнер',1,'932-44-30','932-44-32','Петухов Александр Николаевич','Красногрудов Валерий Александрович'),
  (2,'Мегапроф',2,'254-23-57','254-23-54','Невзгодов Олег Григорьевич','Дроздов Александр Петрович'),
  (3,'Unicum Plus',3,'63-58-04','63-58-02','Иенов Дмитрий Васильевич','Ивалгин Дмитрий Сергеевич'),
  (4,'Мегасофт',1,'932-67-35','932-67-34','Кулик Иван Степанович','Кузнецов Николай Семенович');

DROP TABLE IF EXISTS `dse_city_3`;
CREATE TABLE `dse_city_3` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(40) DEFAULT NULL,
  `city_tel_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `dse_city_3` (city_id, city_name, city_tel_code) VALUES
  (1,'Москва','095'),
  (2,'Киев','044'),
  (3,'Алматы','03272');

DROP TABLE IF EXISTS `dse_tdisk_4`;
CREATE TABLE `dse_tdisk_4` (
  `tdisk_id` int NOT NULL AUTO_INCREMENT,
  `disk_type_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`tdisk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `dse_tdisk_4` (tdisk_id, disk_type_name) VALUES
  (1,'Системный диск'),
  (2,'Прикладное и системное ПО'),
  (3,'Музыка'),
  (4,'Обучающие программы');
```

![[1.2.png]]

```
dse_disks
├── dse_disk_1
│   ├── disk_id (PK, int, AUTO_INCREMENT)
│   ├── disk_name (varchar(80))
│   ├── purchase_price (decimal(10,2))
│   ├── selling_price (decimal(10,2))
│   ├── firm_id (int, FK → dse_firm_2.firm_id)
│   ├── tdisk_id (int, FK → dse_tdisk_4.tdisk_id)
│   └── disk_count (int)

├── dse_firm_2
│   ├── firm_id (PK, int, AUTO_INCREMENT)
│   ├── firm_name (varchar(40))
│   ├── city_id (int, FK → dse_city_3.city_id)
│   ├── agent_tel_fax (varchar(20))
│   ├── director_tel_fax (varchar(20))
│   ├── agent_name (varchar(40))
│   └── director_name (varchar(40))

├── dse_city_3
│   ├── city_id (PK, int, AUTO_INCREMENT)
│   ├── city_name (varchar(40))
│   └── city_tel_code (varchar(20))

└── dse_tdisk_4
    ├── tdisk_id (PK, int, AUTO_INCREMENT)
    └── disk_type_name (varchar(40))
```

