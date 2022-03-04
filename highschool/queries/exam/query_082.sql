-- Show the course acronym, subject acronym and name of the subjects with the lowest average grade.

use highschool;

select c.acronym, s.subject_id, s.acronym, s.name, avg(e.grade)
from subject s
inner join course c
    on s.course_id = c.course_id
inner join enrolled e
    on e.subject_id = s.subject_id
group by s.subject_id
having avg(e.grade) = (
    select min(g.average_grade)
    from (
        select avg(e.grade) average_grade
        from subject s
        inner join enrolled e
            on e.subject_id = s.subject_id
        group by s.subject_id
    ) g
)
order by c.acronym, s.subject_id;
