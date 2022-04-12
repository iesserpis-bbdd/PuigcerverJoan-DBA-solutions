select
    concat(c.acronym, "-", g.letter) `group`,
    s.DNI,
    p.surname,
    p.name,
    avg(e.grade) avg_grade
from student s
inner join person p
    on s.DNI = p.DNI
inner join `group` g
    on s.course_id = g.course_id and s.group_letter = g.letter
inner join course c
    on g.course_id = c.course_id
left join enrolled e
    on e.studentDNI = s.DNI
group by s.DNI
order by `group`, p.surname, p.name, avg_grade;
