use highschool;

drop trigger if exists check_maximum_students_group_insert;
drop trigger if exists check_maximum_students_group_update;

delimiter //
create trigger check_maximum_students_group_insert
before insert on student
for each row 
begin
    declare count_students int;
    declare course_acronym type of course.acronym;
    declare error_message text;

    select count(s.DNI)
    into count_students
    from student s
    where s.course_id = new.course_id
        and s.group_letter = new.group_letter;

    if count_students >= 10
    then
        select acronym
        into course_acronym
        from course
        where course_id = new.course_id;

        set error_message = concat(
            "The group \"",
            course_acronym,
            "-",
            new.group_letter,
            "\" can't have more than 10 students"
        );

        signal sqlstate '45000' set message_text = error_message;
    end if;
end; //

create trigger check_maximum_students_group_update
before update on student
for each row 
begin
    declare count_students int;
    declare course_acronym type of course.acronym;
    declare error_message text;

    select count(s.DNI)
    into count_students
    from student s
    where s.course_id = new.course_id
        and s.group_letter = new.group_letter;

    if count_students >= 10
    then
        select acronym
        into course_acronym
        from course
        where course_id = new.course_id;

        set error_message = concat(
            "The group \"",
            course_acronym,
            "-",
            new.group_letter,
            "\" can't have more than 10 students"
        );

        signal sqlstate '45000' set message_text = error_message;
    end if;
end; //
