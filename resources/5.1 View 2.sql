Create view dse_lamp_brand_category as
select
	l.lamp_id,
    l.lamp_name,
    b.brand_name,
    c.category_name,
    case
		when l.price < 45 then 'small'
        else 'large'
	end as price
from dse_lamp l
left join dse_brand b on l.brand_id = b.brand_id
left join dse_category c on l.category_id = c.category_id;

Select * from dse_lamp_brand_category;