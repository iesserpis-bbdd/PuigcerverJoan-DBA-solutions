use highschool;

create or replace view view_student as
    select
        c.acronym course, 
        s.group_letter, 
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
    order by course, s.group_letter, s.dni;
