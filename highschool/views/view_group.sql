use highschool;

create or replace view view_group as
    select c.acronym, g.letter, g.tutorDNI, p.name tutor_name, p.surname tutor_surname, count(s.DNI) students
    from `group` g
    inner join course c
        on g.course_id = c.course_id
    inner join student s
        on g.course_id = s.course_id and g.letter = s.group_letter
    inner join teacher t
        on g.tutorDNI = t.DNI
    inner join person p
        on p.DNI = t.DNI
    group by c.acronym, g.letter;
