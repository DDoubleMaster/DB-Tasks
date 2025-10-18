# TASK 4.1. ГРУППИРОВКА ДАННЫХ
```SQL
-- task_4_1_city_firm_count.sql
-- Вариант 11, Шынгыс, 2025
-- Задание: Город - количество фирм

Select c.city_name, count(distinct f.firm_id) as firm_count
from dse_disk_1 d
left join dse_firm_2 f on d.firm_id = f.firm_id
left join dse_city_3 c on f.city_id = c.city_id
group by c.city_name
order by firm_count desc;


-- Test
  
-- select disk_name, firm_name, city_name from dse_disk_1 d
-- left join dse_firm_2 f on d.firm_id = f.firm_id
-- left join dse_city_3 c on f.city_id = c.city_id
```
![4.1.png](/resources/4.1.png)