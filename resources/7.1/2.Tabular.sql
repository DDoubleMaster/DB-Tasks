-- средняя цена по категориям через подзапрос в from
select c.category_name, avg_tbl.avg_price
from dse_category c
join (
    select category_id, avg(price) as avg_price
    from dse_lamp
    group by category_id
) avg_tbl on c.category_id = avg_tbl.category_id;