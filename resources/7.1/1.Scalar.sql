-- найти лампы с минимальной ценой
select lamp_name, price
from dse_lamp
where price = (select min(price) from dse_lamp);