use highschool;
drop function if exists average_subject_grade;

delimiter //
create function average_subject_grade (
    in subject_id varchar(4),
    in year int
)
returns decimal(4, 2) unsigned
not deterministic
begin
    declare average_grade decimal(4, 2) unsigned;

    select avg(e.grade)
    into average_grade
    from enrolled e
    where e.subject_id = subject_id
        and e.year = year;

    return average_grade;

end; //
delimiter ;
