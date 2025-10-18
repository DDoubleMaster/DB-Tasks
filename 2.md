# TASK 2. СОЗДАНИЕ ПЕРСОНАЛЬНОЙ БАЗЫ ДАННЫХ С ТАБЛИЦАМИ
```SQL
CREATE DATABASE IF NOT EXISTS dse_lamps;
USE dse_lamps;

CREATE TABLE dse_brand (
  brand_id INT NOT NULL AUTO_INCREMENT,
  brand_name VARCHAR(100) NOT NULL,
  country VARCHAR(50),
  PRIMARY KEY (brand_id)
);

INSERT INTO dse_brand (brand_name, country) VALUES
  ('LightPro', 'Germany'),
  ('BrightHome', 'USA'),
  ('EcoLamp', 'China'),
  ('NordicDesign', 'Sweden');

CREATE TABLE dse_category (
  category_id INT NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (category_id)
);

INSERT INTO dse_category (category_name) VALUES
  ('Office'),
  ('Decorative'),
  ('Study'),
  ('Children');

CREATE TABLE dse_material (
  material_id INT NOT NULL AUTO_INCREMENT,
  material_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (material_id)
);

INSERT INTO dse_material (material_name) VALUES
  ('Metal'),
  ('Wood'),
  ('Plastic'),
  ('Glass');

CREATE TABLE dse_lamp (
  lamp_id INT NOT NULL AUTO_INCREMENT,
  lamp_name VARCHAR(150) NOT NULL,
  brand_id INT,
  category_id INT,
  material_id INT,
  price DECIMAL(10,2),
  in_stock INT,
  PRIMARY KEY (lamp_id),
  FOREIGN KEY (brand_id) REFERENCES dse_brand(brand_id),
  FOREIGN KEY (category_id) REFERENCES dse_category(category_id),
  FOREIGN KEY (material_id) REFERENCES dse_material(material_id)
);

INSERT INTO dse_lamp (lamp_name, brand_id, category_id, material_id, price, in_stock) VALUES
  ('Classic Desk Lamp', 1, 1, 1, 45.99, 20),
  ('Wooden Retro Lamp', 4, 2, 2, 89.50, 10),
  ('Eco Plastic Lamp', 3, 3, 3, 25.00, 50),
  ('Glass Study Lamp', 2, 3, 4, 60.00, 15),
  ('Children Night Lamp', 3, 4, 3, 18.75, 30);

CREATE TABLE dse_order (
  order_id INT NOT NULL AUTO_INCREMENT,
  lamp_id INT,
  quantity INT,
  order_date DATE,
  PRIMARY KEY (order_id),
  FOREIGN KEY (lamp_id) REFERENCES dse_lamp(lamp_id)
);

INSERT INTO dse_order (lamp_id, quantity, order_date) VALUES
  (1, 2, '2025-10-01'),
  (2, 1, '2025-10-05'),
  (3, 5, '2025-10-07'),
  (5, 3, '2025-10-10');
```

![2.png](/resources/2.png)

```
dse_lamps
├── dse_brand
│   ├── brand_id (PK, int, AUTO_INCREMENT)
│   ├── brand_name (varchar(100), NOT NULL)
│   └── country (varchar(50))

├── dse_category
│   ├── category_id (PK, int, AUTO_INCREMENT)
│   └── category_name (varchar(100), NOT NULL)

├── dse_material
│   ├── material_id (PK, int, AUTO_INCREMENT)
│   └── material_name (varchar(100), NOT NULL)

├── dse_lamp
│   ├── lamp_id (PK, int, AUTO_INCREMENT)
│   ├── lamp_name (varchar(150), NOT NULL)
│   ├── brand_id (FK → dse_brand.brand_id)
│   ├── category_id (FK → dse_category.category_id)
│   ├── material_id (FK → dse_material.material_id)
│   ├── price (decimal(10,2))
│   └── in_stock (int)

└── dse_order
    ├── order_id (PK, int, AUTO_INCREMENT)
    ├── lamp_id (FK → dse_lamp.lamp_id)
    ├── quantity (int)
    └── order_date (date)
```