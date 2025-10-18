Select * -- Выбрать все 
from dse_disk_1 -- из таблицы dse_disk_1
where purchase_price * 300 -- где столбец purchase_price умноженная на 300 (плюс минус конвертация с тенге в доллар)
< 600 -- меньше 600