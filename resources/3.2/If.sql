Select lamp_name,
	if(in_stock >= 30, "Много", "Мало") as stock_status
from dse_lamp;