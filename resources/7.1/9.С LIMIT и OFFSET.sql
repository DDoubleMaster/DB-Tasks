-- третья по дороговизне лампа
select lamp_name, price
from dse_lamp
where price = (
    select price
    from dse_lamp
    order by price desc
    limit 1 offset 2
);