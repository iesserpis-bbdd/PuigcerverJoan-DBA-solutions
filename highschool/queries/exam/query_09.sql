-- Look for the student that have failed the most subjects in the year 2021.
-- Also, look for the DNI of the tutor of its group.

use highschool;

select s.dni studentDNI, count(e.grade) failed_subjects, g.tutorDNI
from student s
inner join enrolled e
    on e.studentDNI = s.dni
inner join `group` g
    on s.course_id = g.course_id and s.group_letter = g.letter
where e.grade < 5
group by s.dni
having count(e.grade) >= all (
    select count(e.grade)
    from enrolled e
    where e.grade < 5
    group by e.studentDNI
);

