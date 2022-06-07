use highschool;

delimiter //
create or replace procedure student_retrieve_material (
    in studentDNI varchar(10),
    in material_id int,
    in amount int
)
not deterministic
begin
    declare tutorDNI type of teacher.DNI;

    select g.tutorDNI
    into tutorDNI
    from `group` g
    inner join student s
        on g.course_id = s.course_id
       and g.letter = s.group_letter
    where s.DNI = studentDNI;

    call retrieve_material(tutorDNI, material_id, amount);
end; //
delimiter ;
