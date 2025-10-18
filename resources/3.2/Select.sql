Select l.lamp_name, b.brand_name, c.category_name, m.material_name, l.price, l.in_stock
from dse_lamp l
left join dse_brand b on b.brand_id = l.brand_id
left join dse_category c on c.category_id = l.category_id
left join dse_material m on m.material_id = l.material_id