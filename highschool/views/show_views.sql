-- Option 1
use highschool;
show full tables where table_type = "view";

-- Option 2
select table_name, is_updatable
from information_schema.views 
where table_schema = "highschool";
