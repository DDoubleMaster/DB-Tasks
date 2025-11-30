-- бренды, у которых есть хотя бы одна лампа
select b.brand_name
from dse_brand b
where exists (
    select 1 from dse_lamp l where l.brand_id = b.brand_id
);