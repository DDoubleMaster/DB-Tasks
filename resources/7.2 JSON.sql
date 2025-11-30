-- задание 7.2. работа с json в mysql
-- база: dse
-- таблица: dse_lamp

-- 1. добавляем json‑поле metadata
Alter table dse_lamp
Add column metadata json default null after in_stock;

-- 2. заполняем metadata для разных ламп
Update dse_lamp
Set metadata = json_object(
    'power_watts', 60,
    'color_temp', '3000K',
    'switch_type', 'button'
)
Where lamp_name = 'Classic Desk Lamp';

Update dse_lamp
Set metadata = json_object(
    'style', 'retro',
    'material_finish', 'oak',
    'bulb_type', 'E27'
)
Where lamp_name = 'Wooden Retro Lamp';

Update dse_lamp
Set metadata = json_object(
    'eco_certified', true,
    'power_watts', 15,
    'lifespan_hours', 20000
)
Where lamp_name = 'Eco Plastic Lamp';

Update dse_lamp
Set metadata = json_object(
    'glass_type', 'frosted',
    'year', 2023,
    'bulb_included', false
)
Where lamp_name = 'Glass Study Lamp';

Update dse_lamp
Set metadata = json_object(
    'theme', 'cartoon',
    'safety_certified', true,
    'age_group', '3-7'
)
Where lamp_name = 'Children Night Lamp';

-- 3. пять разных запросов к json‑полю

-- a) извлечение скалярного значения
Select lamp_name, metadata->>'$.power_watts' as watts
From dse_lamp
Where metadata->>'$.power_watts' is not null;

-- b) фильтрация по значению внутри json
Select lamp_name
From dse_lamp
Where metadata->>'$.eco_certified' = 'true';

-- c) проверка существования поля
Select lamp_name
From dse_lamp
Where json_contains_path(metadata, 'one', '$.year');

-- d) обновление json‑документа
Update dse_lamp
Set metadata = json_set(metadata, '$.warranty_months', 24)
Where category_id = 1;

-- e) удаление поля из json
Update dse_lamp
Set metadata = json_remove(metadata, '$.bulb_included')
Where lamp_name = 'Glass Study Lamp';

-- 4. виртуальный столбец и индекс
Alter table dse_lamp
Add column year_of_release int
As (cast(metadata->>'$.year' as unsigned)) stored;

Create index idx_year on dse_lamp (year_of_release);

-- запрос, использующий индекс
Select lamp_name, year_of_release
From dse_lamp
Where year_of_release = 2023;

-- 5. триггер для автоматического заполнения metadata
Delimiter //
Create trigger trg_lamp_insert
Before insert on dse_lamp
For each row
Begin
    If new.category_id = 4 then
        Set new.metadata = json_object(
            'theme', 'default',
            'safety_certified', true,
            'age_group', 'kids'
        );
    Elseif new.category_id = 1 then
        Set new.metadata = json_object(
            'power_watts', 40,
            'color_temp', '4000K'
        );
    End if;
End;
//
Delimiter ;