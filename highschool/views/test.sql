use highschool;

select * from view_student;

select * from view_daw;

alter view view_student as
    select
        CONCAT(c.acronym, "-", s.group_letter) as `group`,
        s.dni,
        s.nia,
        p.name,
        p.surname,
        p.birth_date,
        p.phone,
        p. corporate_email,
        p.personal_email
    from student s
        inner join person p
    on p.dni = s.dni
        inner join course c
    on c.course_id = s.course_id
    order by `group`, s.group_letter, s.dni;

alter view view_daw as
select *
from view_student
where `group` like "DAW-%";
