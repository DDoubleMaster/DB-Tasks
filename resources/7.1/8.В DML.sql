-- увеличить цену на 10% для ламп дешевле среднего
update dse_lamp
set price = price * 1.1
where price < (select avg(price) from dse_lamp);