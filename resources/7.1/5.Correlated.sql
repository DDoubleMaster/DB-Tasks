-- лампы дороже среднего по своей категории
select lamp_name, price
from dse_lamp l
where price > (
    select avg(l2.price)
    from dse_lamp l2
    where l2.category_id = l.category_id
);