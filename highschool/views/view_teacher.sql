use highschool;

create or replace view view_teacher as
    select
        t.dni,
        p.name,
        p.surname,
        p.birth_date,
        p.phone,
        p. corporate_email,
        p.personal_email
    from teacher t
    inner join person p
        on p.dni = t.dni;
