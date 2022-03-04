-- Show the id, name and acronym of the subjects
-- that the maximum grade obtained in it is greater than 8.

use highschool;

select s.subject_id, s.acronym, s.name
from subject s
inner join enrolled e
    on e.subject_id = s.subject_id
group by s.subject_id
having max(e.grade) > 8
order by s.subject_id;
