Create view dse_lamp_brand_cat_mat as
select
	l.lamp_id,
	l.lamp_name,
    b.brand_name,
    c.category_name,
    m.material_name,
    l.price,
    l.in_stock
from dse_lamp l
left join dse_brand b on l.brand_id = b.brand_id
left join dse_category c on l.category_id = c.category_id
left join dse_material m on l.material_id = m.material_id;

Select * from dse_lamp_brand_cat_mat;