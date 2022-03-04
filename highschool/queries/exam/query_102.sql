-- Show the course acronym, subject acronym and name of the subjects 
-- that all its students have passed the subject.

use highschool;

select c.acronym, s.subject_id, s.acronym, s.name
from subject s
inner join course c
    on s.course_id = c.course_id
where not exists (
    select e.grade
    from enrolled e
    where e.subject_id = s.subject_id and e.grade < 5
)
order by c.acronym, s.subject_id;
