-- лампы дороже хотя бы одной лампы бренда 'EcoLamp'
select lamp_name, price
from dse_lamp
where price > any (
    select price from dse_lamp where brand_id = 3
);