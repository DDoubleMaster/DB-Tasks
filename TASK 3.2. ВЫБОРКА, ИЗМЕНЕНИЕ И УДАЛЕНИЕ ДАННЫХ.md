### INSERT 

```SQL
Insert into dse_lamp(lamp_name, brand_id, category_id, material_id, price, in_stock)
values ("modern metal lamp", 1, 1, 1, 55.90, 12);
```
![Insert.png](/resources/3.2/Insert.png)
### SELECT 
```SQL
Select l.lamp_name, b.brand_name, c.category_name, m.material_name, l.price, l.in_stock
from dse_lamp l
left join dse_brand b on b.brand_id = l.brand_id
left join dse_category c on c.category_id = l.category_id
left join dse_material m on m.material_id = l.material_id
```
![Select.png](/resources/3.2/Select.png)
### DELETE 
```SQL
Delete from dse_order
where order_id = 1
```
![Delete.png](/resources/3.2/Delete.png)
### UPDATE 
```SQL
Update dse_lamp
set price = price * 0.8
where 50 < price;
```
![Update.png](/resources/3.2/Update.png)
### TRUNCATE 
```SQL
Truncate table dse_order
```
![Truncate.png](/resources/3.2/Truncate.png)
### BETWEEN 
```SQL
Select lamp_name, price, in_stock
from dse_lamp
where in_stock between 20 and 40;
```
![Between.png](/resources/3.2/Between.png)
### CASE_WHEN 
```SQL
Select lamp_name, price,
    case
        when price < 30 then "Не дорогой"
        when price between 30 and 50 then "Средний"
        else "Дорогой"
    end as price_category
from dse_lamp
```
![Case_when.png](/resources/3.2/Case_when.png)
### IF 
```SQL
Select lamp_name,
	if(in_stock >= 30, "Много", "Мало") as stock_status
from dse_lamp;
```
![If.png](/resources/3.2/If.png)
### IFNULL 
```SQL
Select c.category_id, c.category_name, 
	ifnull(l.lamp_name, "/// Имя недоступно ///") as lamp_name
from dse_category c
left join dse_lamp l on c.category_id = l.category_id + 1;
```
![Ifnull.png](/resources/3.2/Ifnull.png)
### IN
```SQL
Select lamp_name, price, brand_id
from dse_lamp
where brand_id in (1, 3);
```
![In.png](/resources/3.2/In.png)