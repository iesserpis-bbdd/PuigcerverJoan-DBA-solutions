use highschool;

create or replace view view_schedule as
    select
        CONCAT(y.start_year, "/", y.end_year) year,
        p.surname,
        p.name,
        c.acronym course,
        s.acronym subject,
        s.name subject_name,
        s.hours
    from teaches ts
    inner join teacher t
        on ts.teacherDNI = t.DNI
    inner join person p
        on t.DNI = p.DNI
    inner join subject s
        on ts.subject_id = s.subject_id
    inner join course c
        on s.course_id = c.course_id
    inner join year y
        on ts.year = y.start_year
    order by year, surname, name, course, subject;
