use highschool;
create or replace view view_grade as
    select
        c.acronym course,
        sb.acronym subject,
        p.surname,
        p.name,
        e.grade
    from enrolled e
    inner join student s
        on e.studentDNI = s.DNI
    inner join person p
        on s.DNI = p.DNI
    inner join subject sb
        on e.subject_id = sb.subject_id
    inner join course c
        on sb.course_id = c.course_id
    order by course, subject, surname, name;
