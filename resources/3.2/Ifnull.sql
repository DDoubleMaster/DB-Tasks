Select c.category_id, c.category_name, 
	ifnull(l.lamp_name, "/// Имя недоступно ///") as lamp_name
from dse_category c
left join dse_lamp l on c.category_id = l.category_id + 1;