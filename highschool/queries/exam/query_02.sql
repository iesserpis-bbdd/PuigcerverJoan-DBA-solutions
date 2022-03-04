-- Show DNI and name of the persons whose surname starts with S and contains an E.

use highschool;

select dni, name, surname
from person
where surname like "S%e%"
order by dni
