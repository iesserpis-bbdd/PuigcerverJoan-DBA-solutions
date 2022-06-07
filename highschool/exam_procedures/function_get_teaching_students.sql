use highschool;

delimiter //
create or replace function get_teaching_students (
    in teacherDNI varchar(10),
    in year int
)
returns int
not deterministic
begin
    declare count_student int;

    select count(e.studentDNI)
    into count_student
    from teaches t
    inner join enrolled e
        on t.subject_id = e.subject_id
       and t.year = e.year
    where t.teacherDNI = teacherDNI
      and t.year = year;

    return count_student;
end; //
delimiter ;
