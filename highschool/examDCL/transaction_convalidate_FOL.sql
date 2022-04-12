use highschool;

set autocommit = 0;
start transaction;

select 
    s.DNI, su_actual.acronym, e_actual.grade, e_actual.year,
    e_passat.grade, e_passat.year
from student s
inner join enrolled e_actual
    on e_actual.studentDNI = s.DNI
inner join subject su_actual
    on e_actual.subject_id = su_actual.subject_id
inner join enrolled e_passat
    on e_passat.studentDNI = s.DNI
inner join subject su_passat
    on e_passat.subject_id = su_passat.subject_id
where su_actual.acronym = "FOL" and e_actual.year = 2021
    and su_passat.acronym = "FOL" and e_passat.year < 2021 and e_passat.grade >= 5
for update;

update enrolled set grade = 5
inner ...

select ...

-- Si s'ha fet bé
commit;

-- Sino
rollback;
