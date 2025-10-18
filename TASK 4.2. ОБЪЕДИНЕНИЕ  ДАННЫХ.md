
Оператор перед join указывает приоритетную таблицу

```SQL
-- В случае left, приоритетной таблицей будет являтся таблица перед оператором join
-- она будет указывать какие строки показывать в зависимости от сходства после on
Select d.disk_name, f.firm_name
from dse_disk_1 d
left join dse_firm_2 f on d.firm_id = f.firm_id + 1;
```
![[4.2 Left.png]]


```SQL
-- В случае right, приоритетной таблицой является та, которая после оператора join
-- то есть при отсутствии сходства после on на стороне не приоритетной таблицы,
-- не приоритетная таблица будет вынуждена указать в своей части значени null
Select f.firm_name, c.city_name
from dse_firm_2 f
right join dse_city_3 c on f.city_id = c.citY_id + 1;
```
![[4.2 Right.png]]


```SQL
-- В случае inner, приоритет распределён равномерно и будут показаны все таблицы
-- которые полностью совпадают в обеих сторонах
Select d.disk_name, t.disk_type_name
from dse_disk_1 d
inner join dse_tdisk_4 t on d.tdisk_id = t.tdisk_id + 1;
```
![[4.2 Inner.png]]


```SQL
-- union объединяет две больше таблицы схожые по размерности и типу значений в одну
Select disk_name as `Name`, selling_price as CP from dse_disk_1 where disk_id = 1
union
Select disk_name, selling_price from dse_disk_1 where disk_id = 2
union
Select disk_name, selling_price from dse_disk_1 where disk_id = 3;
```
![[4.2 Union.png]]