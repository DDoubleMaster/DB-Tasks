Create view dse_lamp_brand as
select
	l.lamp_id,
    l.lamp_name,
    b.brand_name,
    l.price
from dse_lamp l
left join dse_brand b on l.brand_id = b.brand_id;

Select * from dse_lamp_brand;