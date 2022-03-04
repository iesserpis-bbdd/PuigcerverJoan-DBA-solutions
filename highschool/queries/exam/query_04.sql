-- Show the subject acronym of the subjects of the DAW course.
-- Also show the DNI and name of the teachers that teach those subjects in the 2021 year.

use highschool;

select s.acronym, s.name, t.teacherDNI
from subject s
inner join teaches t
    on t.subject_id = s.subject_id
inner join course c
    on s.course_id = c.course_id
where t.year = 2021 and c.acronym = "DAW"
order by s.acronym;
