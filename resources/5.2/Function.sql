-- назначение: считает общую сумму цен всех ламп
-- параметры: нет
-- возвращает: decimal(10,2) – сумма цен
-- особенности: использует курсор для обхода всех ламп

delimiter //
create function dse_total_price()
returns decimal(10,2)
deterministic
begin
    declare v_price decimal(10,2);
    declare v_total decimal(10,2) default 0.00;
    declare done int default 0;

    declare cur cursor for
        select price from dse_lamp;

    declare continue handler for not found set done = 1;

    open cur;
    read_loop: loop
        fetch cur into v_price;
        if done = 1 then
            leave read_loop;
        end if;

        set v_total = v_total + v_price;
    end loop;
    close cur;

    return v_total;
end //
delimiter ;

-- тест
select dse_total_price() as 'total';