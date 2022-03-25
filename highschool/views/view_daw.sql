use highschool;

create or replace view view_daw as
    select *
    from view_student
    where course = "DAW";
