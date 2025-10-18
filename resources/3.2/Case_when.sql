	Select lamp_name, price,
		case
			when price < 30 then "Не дорогой"
			when price between 30 and 50 then "Средний"
			else "Дорогой"
		end as price_category
	from dse_lamp