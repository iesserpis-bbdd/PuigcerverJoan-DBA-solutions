-- Show the code, name and acronym of the subjects of the course with acronym "DAW".
-- Also show the average grade of the grades of students that have passed the subject.

use highschool;

select s.subject_id, s.acronym, s.name, avg(e.grade) average_grade
from subject s
inner join course c
    on s.course_id = c.course_id
inner join enrolled e
    on e.subject_id = s.subject_id
where c.acronym = "DAW" and e.grade >= 5
group by s.subject_id
order by s.subject_id
