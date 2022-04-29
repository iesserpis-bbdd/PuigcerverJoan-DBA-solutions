use highschool;
drop procedure if exists retrieve_material;

delimiter //
create procedure retrieve_material (
    in teacherDNI varchar(10),
    in material_id int,
    in amount int
)
not deterministic
begin
    declare available_amount type of material.amount;

    set autocommit = 0;
    start transaction;

    select m.amount into available_amount
    from material m
    where m.material_id = material_id
    for update;

    if available_amount >= amount
    then
        update material m
        set m.amount = m.amount - amount
        where m.material_id = material_id;

        insert into material_history(material_id, teacherDNI, amount)
        values (material_id, teacherDNI, amount);
    elseif available_amount < amount and available_amount > 0
        update material m
        set m.amount = 0
        where m.material_id = material_id;

        insert into material_history(material_id, teacherDNI, amount)
        values (material_id, teacherDNI, available_amount);
    then
    end if;

    commit;
    set autocommit = 1;

end; //
delimiter ;
