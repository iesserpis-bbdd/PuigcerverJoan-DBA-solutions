use highschool;
drop procedure if exists grade_student;

delimiter //
create procedure grade_student (
    in studentDNI varchar(10),
    in subject_acronym varchar(4),
    in grade decimal(4, 2),
    in year int
)
not deterministic
begin
    declare subject_id type of subject.subject_id;

    select s.acronym into subject_id
    from subject s
    where s.acronym = subject_acronym;

    if exists(
        select e.studentDNI
        from enrolled e
        where e.studentDNI = studentDNI
            and e.subject_id = subject_id
            and e.year = year;
    ) then
        update enrolled e
        set e.grade = grade
        where e.studentDNI = studentDNI
            and e.subject_id = subject_id
            and e.year = year;
    else 
        insert into enrolled(studentDNI, subject_id, year, grade)
        values (studentDNI, subject_id, year, grade);
    end if;

end; //
delimiter ;
