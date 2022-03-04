-- Show all the subjects that have more than 150 hours ordered by id.

use highschool;

select subject_id, acronym, name
from subject
where hours > 150
order by subject_id;
