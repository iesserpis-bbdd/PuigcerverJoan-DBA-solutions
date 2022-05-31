use highschool;
drop function if exists can_student_promote;

delimiter //
create function can_student_promote (
    in studentDNI varchar(10),
    in year int
)
returns boolean
not deterministic
begin
    declare total_ects int;
    declare passed_ects int;

    select coalesce(sum(s.ects), 0)
    into total_ects
    from enrolled e
    inner join subject s
        on e.subject_id = s.subject_id
    where e.studentDNI = studentDNI
        and e.year = year;

    if total_ects = 0 then
        return null;
    end if;

    select coalesce(sum(s.ects), 0)
    into passed_ects
    from enrolled e
    inner join subject s
        on e.subject_id = s.subject_id
    where e.studentDNI = studentDNI
        and e.year = year
        and e.grade >= 5;

    return passed_ects / total_ects >= 0.8;
end; //
delimiter ;
