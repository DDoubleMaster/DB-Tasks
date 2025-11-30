-- лампы брендов из определённых стран
select lamp_name, price
from dse_lamp
where brand_id in (
    select brand_id from dse_brand where country in ('Germany','USA')
);