-- лампы дешевле всех ламп бренда 'LightPro'
select lamp_name, price
from dse_lamp
where price < all (
    select price from dse_lamp where brand_id = 1
);