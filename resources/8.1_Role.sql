-- 1. создаём роли
create role role_admin;
create role role_manager;
create role role_seller;
create role role_price_editor;
create role role_accountant;
create role role_auditor;
create role role_mobile_app;
create role role_intern;

-- 2. назначаем права

-- админ: полный доступ ко всей базе
grant all privileges on dse_lamps.* to role_admin;

-- менеджер: может читать и изменять товары и заказы
grant select, insert, update, delete on dse_lamps.dse_lamp to role_manager;
grant select, insert, update, delete on dse_lamps.dse_order to role_manager;

-- продавец: только чтение ламп и добавление заказов
grant select on dse_lamps.dse_lamp to role_seller;
grant insert on dse_lamps.dse_order to role_seller;

-- редактор цен: может обновлять только столбец price
grant update (price) on dse_lamps.dse_lamp to role_price_editor;

-- бухгалтер: доступ к заказам и функциям
grant select on dse_lamps.dse_order to role_accountant;
grant execute on procedure dse_lamps.dse_update_stock to role_accountant;

-- аудитор: только чтение всех таблиц
grant select on dse_lamps.* to role_auditor;

-- мобильное приложение: доступ только к чтению представления (например, view_lamps)
-- (представление нужно создать отдельно: create view view_lamps as select lamp_name, price from dse_lamp;)
grant select on dse_lamps.dse_lamp_brand_category to role_mobile_app;

-- стажёр: наследует роль продавца, но только чтение ламп
grant role_seller to role_intern;
grant select on dse_lamps.dse_lamp to role_intern;

-- 3. создаём пользователей
create user 'ivanov_admin'@'localhost' identified by 'Adm1n#2025';
create user 'petrova_manager'@'localhost' identified by 'Manag3r#2025';
create user 'sidorov_seller'@'localhost' identified by 'Sell3r#2025';
create user 'smirnova_price'@'localhost' identified by 'Pr1ce#2025';
create user 'volkov_accountant'@'localhost' identified by 'Acc0unt#2025';
create user 'egorov_auditor'@'localhost' identified by 'Aud1t#2025';
create user 'app_mobile'@'localhost' identified by 'Mob1le#2025';
create user 'intern_2025'@'localhost' identified by 'Intern#2025';

-- 4. назначаем роли пользователям
grant role_admin to 'ivanov_admin'@'localhost';
grant role_manager to 'petrova_manager'@'localhost';
grant role_seller to 'sidorov_seller'@'localhost';
grant role_price_editor to 'smirnova_price'@'localhost';
grant role_accountant to 'volkov_accountant'@'localhost';
grant role_auditor to 'egorov_auditor'@'localhost';
grant role_mobile_app to 'app_mobile'@'localhost';
grant role_intern to 'intern_2025'@'localhost';

-- устанавливаем роли по умолчанию
set default role all to 'ivanov_admin'@'localhost';
set default role all to 'petrova_manager'@'localhost';
set default role all to 'sidorov_seller'@'localhost';
set default role all to 'smirnova_price'@'localhost';
set default role all to 'volkov_accountant'@'localhost';
set default role all to 'egorov_auditor'@'localhost';
set default role all to 'app_mobile'@'localhost';
set default role all to 'intern_2025'@'localhost';