-- Show the DNI, name, surname and birth_date of the youngest student.

use highschool;

select s.DNI, p.name, p.surname, p.birth_date
from student s
inner join person p
    on s.dni = p.dni
where p.birth_date = (
    select max(p.birth_date)
    from student s
    inner join person p
        on s.dni = p.dni
)
order by s.dni;
