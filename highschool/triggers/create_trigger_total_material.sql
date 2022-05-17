use highschool;

create trigger increment_material
    after insert on material
    for each row 
    update total_material set amount = amount + new.amount;

create trigger update_material
    after update on material
    for each row 
    update total_material set amount = amount + new.amount - old.amount;

create trigger delete_material
    after delete on material
    for each row 
    update total_material set amount = amount - old.amount;
