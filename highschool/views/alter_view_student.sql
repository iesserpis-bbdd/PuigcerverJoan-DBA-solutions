use highschool;

alter view view_student as
    select
        CONCAT(c.acronym, "-", s.group_letter) `group`,
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
    on c.course_id = s.course_id;
